class EmployeesController < ApplicationController
#include Utilities
#layout 'employee'


before_filter :login_required
before_filter :find_logged_emp
#before_filter :find_user_id


 def new
    @employee=Employee.new
    @user=User.new
@dep=Department.all
    
	#@employee.leaves.build
	
 end

 def index
      @emp=current_emp
if @emp.roles == "Admin" 
@employees=Employee.search(params[:search]).paginate(:page => params[:page], :per_page => 4)
else
@employees=Employee.search(params[:search]).where("empid=?", @emp.empid).paginate(:page => params[:page], :per_page => 4)
end
 # @employees=Employee.all

 end

def aindex
 #@employees=Employee.all
@employees=Employee.search(params[:search])
 end






def create
     #@employee=Employee.new
     @user=User.new
     @user.login=params[:employee][:empid]
     @user.email=params[:employee][:email]
     @employee=Employee.new(params[:employee])
     @employee.age=@employee.doj.year-@employee.dob.year
@employee.depid=Department.where("id=?", @employee.depid).pluck(:depid)[0]
     @user.employee=@employee

     Rails.logger.info("The mob no is: #{@employee.mobno}")
	if @employee.save && @user.save 

         #flash[:notice] = "New employee with emp id: #{@employee.empid} was successfully created!"
         Notifications.welcome(@user).deliver
         redirect_to :action => "index"
       else
          #Rails.logger.info("The errors are: #{@employee.errors.full_messages}")
          #flash[:errors]=(@employee.errors)
          redirect_to new_employee_path
          #render :action => "new"
      end
  end
 

  def edit
@dep=Department.all
      @employee=Employee.find(params[:id])
  end


def update
     @employee=Employee.find(params[:id])
     @employee.update_attributes(params[:employee])
@employee.depid=Department.where("id=?", @employee.depid).pluck(:depid)[0]
     if @employee.save 
     	redirect_to employees_path
     else
     	render :action => "edit"
     end
 end


 
  def show
      @employee=Employee.find(params[:id])
  end
 def find_logged_emp
      @emp=current_emp
      
  end


  
 # def find_logged_emp
 #     @emp=current_emp
 #     Rails.logger.info("Kani-This users emp id is: #{@emp.emp_id}")
 # end

  #def find_user_id
   #   @uid=current_user_id
  #end
end
