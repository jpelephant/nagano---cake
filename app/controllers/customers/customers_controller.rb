class Customers::CustomersController < ApplicationController
  def show
    @customers = Customer.find(params[:id])
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end
  
  def withdrawal
  end
  
  def destroy
  end
  
   private

  def customer_params
    params.require(:customer).permit(:full_name, :full_name_kana, :postal_code, :address, :telephone_number, :emaill)
  end
end
