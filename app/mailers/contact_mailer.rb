class ContactMailer < ActionMailer::Base
  
  # default :from => "info@yoga.lu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def message_from_contact_form(contact)  
    @contact = contact  
    mail to: 'swami@TenThousandHours.eu',  from: "\"#{@contact.sender_name}\" <#{@contact.sender_email}>" , subject: 'Message from the contact form'
  end
end
