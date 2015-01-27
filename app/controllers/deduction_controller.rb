class DeductionController < ApplicationController
before_filter :login_required
before_filter :find_logged_emp

def new
@emp=current_emp
@deduction=Deduction.new
end


def index
@emp=current_emp
@deduction=Deduction.search(params[:search]).paginate(:page => params[:page], :per_page => 4)
end

def create
@deduction=Deduction.new(params[:deduction])
if @deduction.save
redirect_to :action => 'index'
else 
render :action => "new"
end
end

def edit
@emp=current_emp
@deduction=Deduction.find(params[:id])
end

def update
@deduction=Deduction.find(params[:id])
@deduction.update_attributes(params[:deduction])
redirect_to :action => "index"
end 

def show
@emp=current_emp
@deduction=Deduction.find(params[:id])

end

 def find_logged_emp
      @emp=current_emp
      end
end
