class ComplaintController < ApplicationController
before_filter :login_required
before_filter :find_logged_emp

def index
@emp=current_emp
if @emp.roles == "Admin" 
@complaints=Complaints.search(params[:search])
else
@complaints=Complaints.search(params[:search]).where("empid=?", @emp.empid)
end
end

def new
@emp=current_emp
@empid=@emp.empid
@empname=@emp.empname
@complaint=Complaints.new


end

def create
@emp=current_emp
@complaint=Complaints.new(params[:complaint])
@empdetails=Employee.where("empid=?",@complaint.empid)

if @complaint.save
redirect_to :action => "index"
else
render :action => "new"
end
end

def edit
      @complaint=Complaints.find(params[:id])
end

def update
     @complaint=Complaints.find(params[:id])
     @complaint.update_attributes(params[:complaint])
     redirect_to :action => "index"
 end

 def find_logged_emp
      @emp=current_emp
      
  end

end
