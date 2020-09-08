class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.buyer_role?
      return root_path
    end
    rails_admin_path
  end
end
