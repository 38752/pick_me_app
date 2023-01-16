class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :block_edit_or_delete_account, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def block_edit_or_delete_account
    if params[:controller] == 'devise/registrations'
      if params[:action] == 'edit' || params[:action] == 'update' || params[:action] == 'destroy'
        redirect_to root_path
      end
    end
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :how_old_id, :sex_id])
  end
end
