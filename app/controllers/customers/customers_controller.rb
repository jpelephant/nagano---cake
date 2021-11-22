class Customers::CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end
  
  def update
  end
  
  def withdrawal
  end
  
  def destroy
  end
end
