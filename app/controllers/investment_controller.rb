class InvestmentController < ApplicationController
def index
@investment=Investment.all
end
def new
@investment=Investment.new
end
def create
@investment=Investment.new(params[:investment])
@investment.save
redirect_to :action => 'index'

end
def show 
@investment=Investment.find(params[:id])
end
end
