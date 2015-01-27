class SalaryController < ApplicationController
before_filter :login_required
before_filter :find_logged_emp

def aindex
@emp=current_emp
if @emp.roles == "Admin" 
@salary=SalaryStructure.search(params[:search])
else
@salary=SalaryStructure.search(params[:search]).where("empid=?", @emp.empid)
end
end

def anew
@emp=current_emp
@salarystruct=SalaryStructure.new
@employee=Employee.all
end

def acreate
@salarystruct=SalaryStructure.new(params[:salarystruct])
@empdetails=Employee.where("empid=?",@salarystruct.empid)
@salarystruct.empid=Employee.where("id=?", @salarystruct.empid).pluck(:empid)[0]
@salarystruct.empname=Employee.where("id=?", @salarystruct.empid).pluck(:empname)[0]
@salarystruct.gross_salary=@salarystruct.basicpay+@salarystruct.hra+@salarystruct.da+@salarystruct.ca+@salarystruct.sa+@salarystruct.medical+@salarystruct.leavetransallowance+@salarystruct.bonus
if @salarystruct.save
redirect_to :action => "aindex"
else
render :action =>'anew'
end
end


def ashow
@emp=current_emp
@salarystruct=SalaryStructure.find(params[:id])
end


def index
@emp=current_emp
@salary=SalaryDetails.search(params[:search])
end





def new
@emp=current_emp
@salary=SalaryDetails.new
@employee=SalaryStructure.all

end




def create
@salary=SalaryDetails.new(params[:salary])
@salaryst=Employee.where("empid=?", @salary.empid).pluck(:empid)[0]
@salary.empid=@salaryst
@salary.empname=Employee.where("empid=?",@salary.empid).pluck(:empname)[0]
@salarystructure=SalaryStructure.find(:all, :conditions => {:empid => @salaryst})
@salary.basicpay = (@salarystructure[0].basicpay/@salary.daysinmonth)*@salary.dayspaid
@salary.hra  = (@salarystructure[0].hra/@salary.daysinmonth)*@salary.dayspaid
@salary.da = (@salarystructure[0].da/@salary.daysinmonth)*@salary.dayspaid
@salary.ca = (@salarystructure[0].ca/@salary.daysinmonth)*@salary.dayspaid
@salary.sa = (@salarystructure[0].sa/@salary.daysinmonth)*@salary.dayspaid
@salary.medical = (@salarystructure[0].medical/@salary.daysinmonth)*@salary.dayspaid
@salary.leavetransallowance = (@salarystructure[0].leavetransallowance/@salary.daysinmonth)*@salary.dayspaid
@salary.bonus = (@salarystructure[0].bonus/@salary.daysinmonth)*@salary.dayspaid
@salary.gross_salary=@salary.basicpay+@salary.hra+@salary.da+@salary.ca+@salary.sa+@salary.medical+@salary.leavetransallowance+@salary.bonus
@salary.salaryded=@salarystructure[0].salaryded
@salary.esi=@salarystructure[0].esi
@yearsalary=@salarystructure[0].gross_salary*12
if @yearsalary <= 48,000
	@salary.professionaltax=0;
 

#@a=(Time.now.year).to_s
#@b=(Time.now.year+1).to_s
#@c=@a+"-"+@b
#@taxslab=Taxslab.where("financialyear=?", @c) 
if @salary.save
redirect_to :action => 'index'
else
render :action => 'new'
end
end

def show
@emp=current_emp
@salary=SalaryDetails.find(params[:id])
@empdetails=Employee.where("empid=?",@salary.empid)
@dept=Department.where("depid=?",@empdetails.pluck(:depid)[0]).pluck(:depname)[0]
@designation=@empdetails.pluck(:designation)[0]
@pan=@empdetails.pluck(:panno)[0]
@yearbasic=@salary.basicpay * 12
@yearhr=@salary.hra * 12
@yearda=@salary.da * 12
@yearca=@salary.ca * 12
@yearsa=@salary.sa * 12
@yearmedical=@salary.medical * 12
@yearleavetransallowance=@salary.leavetransallowance * 12
@yearbonus=@salary.bonus * 12
@yeargross_salary=@salary.gross_salary * 12
end

def edit
@salary=SalaryDetails.find(params[:id])
end

def update
@salary=SalaryDetails.find(params[:id])
@salary.update_attributes(params[:salary])
end








 def find_logged_emp
      @emp=current_emp
      
  end


end
