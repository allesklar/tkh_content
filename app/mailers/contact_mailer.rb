class ContactMailer < ActionMailer::Base
  
  # default :from => "info@yoga.lu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def message_from_contact_form(contact)  
    @contact = contact
    # FIXME - only the email addresses show up. not the names :-(
    # TODO - what do to if contact_email is not set?
    recipient = "#{Setting.first.company_name} <#{Setting.first.contact_email}>"
    from = "#{@contact.sender_name} <#{@contact.sender_email}>"
    mail to: recipient,  from: from , subject: 'Message from the contact form'
  end
end
