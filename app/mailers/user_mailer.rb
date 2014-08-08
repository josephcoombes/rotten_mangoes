class UserMailer < ActionMailer::Base
  default from: 'joseph@me.com'
 
  def goodbye_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You Account Has Been Deleted')
  end
end
