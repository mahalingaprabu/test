class UserController < ApplicationController

before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']

   
def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to_stored 
      else
	
        flash[:warning] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end

  def forgot_password
    if request.post?
      u = User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:warning]  = "Couldn't send password"
	redirect_to :action=>'login'
      end
    end
  end

def set_password
        @user=User.find(params[:id])
        if request.post?
          Rails.logger.info("Current user is: #{@user.login}")
          if !params[:user][:password].empty? && !params[:user][:password_confirmation].empty?
           if(params[:user][:password] == params[:user][:password_confirmation])
             @user.password=params[:user][:password]
              if @user.save
                 flash[:notice]="Your password has been set"
                 session[:user]=User.authenticate(@user.login,params[:user][:password_confirmation])
                  redirect_to employees_path(@user.id)
              else
                 flash[:errors]=@user.errors
              end
           else
                 flash[:notice]="Password and Password Confirmation do not match, please try again!"
                 render 'set_password'
           end
          else
               flash[:notice]="Please enter values for both Password and Password Confirmation!"
               render :action => 'set_password'
          end
        end
     end


  def change_password
 @emp=current_emp
    @user=session[:user]
    if request.post?
      @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:message]="Password Changed"
         redirect_to :action =>'login'
      end
    end
    
  end

 def find_logged_emp
      @emp=current_emp
      
  end

  
  def hidden
  end
end
