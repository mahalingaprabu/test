class Notifications < ActionMailer::Base
helper EmailHelper
default :from => "kanimozhiradha@yahoo.com"
  def forgot_password(to, login, pass, sent_at = Time.now)
    @subject    = "Your password is ..."
    @recipients = to
    @from       = 'kanimozhiradha@yahoo.com'
    @sent_on    = sent_at
     @password=pass
    mail(:to => @recipients, :subject => @subject, :password => pass)

  end

def welcome(user)
    @login=user.login
    @name=user.employee.empname.capitalize
    @greeting = "Dear #{@name}"
    @password_set_link=url_for(:controller => 'user', :action => 'set_password', :id => user.id)
    mail(:to => user.email, :subject => "Welcome to RapidThink")
  end

end
