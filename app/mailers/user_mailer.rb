class UserMailer < ActionMailer::Base
  default from: "ahmednadar@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email
    @greeting = "Hi"

    mail to: "ahmednadar@gmail.com"
  end
end
