class ContactsController < ApplicationController
  
  before_filter :authenticate,            :except => 'create'
  before_filter :authenticate_with_admin, :except => 'create'
  
  def index
    @contacts = Contact.by_recent.paginate(:page => params[:page], :per_page => 35)
    switch_to_admin_layout
  end

  def create
    @contact = Contact.new(params[:contact])
    saved = @contact.save
    sent_email = send_message_to_admin(@contact)
    
    if saved && sent_email == 'success'
      redirect_to root_path, notice: "Your message has been sent. Thank you very much!"
    elsif saved && sent_email == 'exception'
      flash[:error] = "There was a problem sending this message<br />#{e}"
      redirect_to :back
    elsif saved && sent_email == 'invalid'
      flash[:error] = 'There was a problem sending this message. Your email address does not seem to be valid!'
      redirect_to :back
    else
      flash[:error] = 'Something went wrong. Your message did not reach the intended recipient.'
      redirect_to :back
    end
  end
  
  def valid_email?(string)
    (!string.blank? && string =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i) ? true : false
  end
  # helper_method :valid_email?
  
  private
  
  def send_message_to_admin(contact)
    # check email validity
    if valid_email?(contact.sender_email)    
      # Actually send the email to the student
      begin
        ContactMailer.message_from_contact_form(contact).deliver
        return 'success'
      rescue Exception => e
        AdminMailer.rescued_exceptions(e, "Some exception occurred while trying to send a student his confirmation for registering in a course. The email was never sent!").deliver
        @exception = e
        return 'exception'
      end
    else # for invalid or blank emails
      return 'invalid'
    end
  end
  
  
end