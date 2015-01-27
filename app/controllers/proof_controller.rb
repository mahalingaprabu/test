class ProofController < ApplicationController
def index
	@emp=current_emp
if @emp.roles == "Admin" 
@proofs=Proof.search(params[:search])
else
@proofs=Proof.search(params[:search]).where("empid=?", @emp.empid)
end
end

def new
	@emp=current_emp
	@proof=Proof.new
	@employee=Employee.all
	@empid=@emp.empid
end

def create
	@proof=Proof.new(params[:proof])
	@empdetails=Employee.where("empid=?",@proof.empid)
	@proof.empid=Employee.where("empid=?", @proof.empid).pluck(:empid)[0]
	@proof.empname=Employee.where("empid=?",@proof.empid).pluck(:empname)[0]
	if @proof.save
	redirect_to :action => 'index'
	else
	render :action => 'new'
end
end

def edit
	@emp=current_emp
@employee=Employee.all
	@proof=Proof.find(params[:id])
end





def update
@proof=Proof.find(params[:id])
@proof.update_attributes(params[:proof])
redirect_to :action=>"index"
end

def show 
	@emp=current_emp
	@proof=Proof.find(params[:id])
end

 def find_logged_emp
      @emp=current_emp
      
  end
end
