class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url  = '99cats.com'
    mail(to: user.username, subject: '99 Cats')
  end
end
