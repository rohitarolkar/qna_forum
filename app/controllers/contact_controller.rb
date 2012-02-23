class ContactController < ApplicationController
  def index
  end

  def send_mail
    #Call UserMailer.email_to_user with valid parameters
    
    flash[:notice] = "Sorry The Emails Are currently Disabled for Security Reasons"
    redirect_to :back
  end

end
