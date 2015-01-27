require 'authenticated_system'
class ApplicationController < ActionController::Base

protect_from_forgery
  #before_filter :set_cache_remove

=begin
  def login_required
       return true if session[:user]
       flash[:errors]="Please login to continue"
       session[:return_to]=request.url
       redirect_to :controller => "user", :action => "login"
       return false
  end


  def current_user
      session[:user]
  end

  def current_emp
      session[:user].employee
  end

  def current_user_id
      session[:user].id
  end


  def set_cache_remove
      response.headers["Cache-Control"]="no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"]="no-cache"
      response.headers["Expires"]="Fri, 01 Jan 1990 00:00:00 GMT"
  end
=end

 def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "user", :action => "login"
    return false 
  end

 def current_user
      session[:user]
  end

  def current_emp
      session[:user].employee
  end

  def current_user_id
      session[:user].id
  end


  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to_url(return_to)
    else
      redirect_to :controller=>'employees', :action=>'index'
    end
  end

end




