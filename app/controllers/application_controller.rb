class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
		added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number]

		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
	end

  def after_sign_in_path_for(resource)
  case resource
  when Customer
    items_path
  when Admin
    admin_customers_path
  end
  end

end
