class DepartmentController < ApplicationController
before_filter :login_required
before_filter :find_logged_emp

def new
@emp=current_emp
@department=Department.new
end


def index
@emp=current_emp
@departments=Department.search(params[:search]).paginate(:page => params[:page], :per_page => 4)
end

def create
@department=Department.new(params[:department])
if @department.save
redirect_to :action => 'index'
else 
render :action => "new"
end
end

def edit
@emp=current_emp
@department=Department.find(params[:id])
end

def update
@department=Department.find(params[:id])
@department.update_attributes(params[:department])
end 

def show
@emp=current_emp
@department=Department.find(params[:id])

end

 def find_logged_emp
      @emp=current_emp
      
  end

end
