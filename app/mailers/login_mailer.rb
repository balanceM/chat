class LoginMailer < ApplicationMailer
  def notify_message(user)
    @user = user
    mail(to: user.email, subject: "Hey! You have login")
  end
end
