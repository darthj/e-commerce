class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :categories, :brands

  	def categories
  		@categories = Category.order(:name)
  	end

	def brands
	  @brands = Product.pluck(:brand).sort.uniq
	end
protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [])
  	devise_parameter_sanitizer.permit(:account_update, keys: [])
  end

end
