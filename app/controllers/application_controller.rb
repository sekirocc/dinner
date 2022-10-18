class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!, :auth_not_blocked!


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/orders', :alert => exception.message
  end

  def auth_not_blocked!
    return true if current_user && ( current_user.admin? or current_user.can_manage_dishes? or !current_user.blocked )
    respond_to do |format|
      format.html { redirect_to "/users/sign_in" }
    end
    return false
  end

private
  def after_sign_in_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    home_path = :"#{scope}_root_path"
    respond_to?(home_path, true) ? send(home_path) : root_url
  end

  def after_sign_out_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    home_path = :"#{scope}_root_path"
    respond_to?(home_path, true) ? send(home_path) : root_url
  end

end
