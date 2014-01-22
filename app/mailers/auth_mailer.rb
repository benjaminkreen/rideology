class AuthMailer < ActionMailer::Base
  default from: "admin@rideology.com"
  
  def signup_email(user)
    @user = user
    mail(
      :to => user.email,
      :subject => 'Thanks for signin up'
    )
  end
end
