class UserMailer < ActionMailer::Base
  def send_birthday_reminder(user, friends)
    @user = user
    @friends = friends
    mail(from: 'php.dev1987@gmail.com', to: user.email, subject: 'Birthday Reminder')
  end
end
