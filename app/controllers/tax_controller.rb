class TaxController < ApplicationController
before_filter :login_required

def index
@emp=current_emp
@taxs=Taxslab.search(params[:search]).paginate(:page => params[:page], :per_page => 4)
@taxs=Taxslab.group(:financialyear)

end

def new
  @tax = Taxslab.new 

@emp=current_emp
end



def create


  
@emp=current_emp
@tax = Taxslab.new(params[:tax]) 
@tax.save
redirect_to :action => 'index'
end

def show
@emp=current_emp
@tax=Taxslab.find(params[:id])
 @tax.financialyear
@taxs=Taxslab.find(:all, :conditions => {:financialyear => @tax.financialyear})
end

def edit
@emp=current_emp
@tax=Taxslab.find(params[:id])
end


def find_logged_emp
      @emp=current_emp
end
end
