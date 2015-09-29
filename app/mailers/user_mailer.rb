class UserMailer < ApplicationMailer
<<<<<<< HEAD
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
=======
>>>>>>> user-story-receive-incoming-emails
end
