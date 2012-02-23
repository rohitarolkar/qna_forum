class UserMailer < ActionMailer::Base
  default :from => "rohit.arolkar@livialegal.com"

  def email_to_user(user,sender_email,subject)
    @user = user
    @url  = "http://ask-away.herokuapp.com/"
    @content = "Checking if works here"
    mail( :to => "rohit.arolkar@livialegal.com", :subject => subject)
  end
end
