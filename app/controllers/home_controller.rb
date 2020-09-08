class HomeController < ActionController::Base
  before_action ->{ authenticate_user!(force: false) }
  def index
    @products = Product.all.with_attached_image
  end
end