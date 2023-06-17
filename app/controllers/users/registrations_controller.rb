# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :сonfigure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #     super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   public

  # If you have extra params to permit, append them to the sanitizer.

  def сonfigure_sign_up_params
    #render plain: params[:user].inspect
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :forme, :teacher])
    params.require(:user).permit(:surname, :email, :password, :password_confirmation, :forme, :teacher)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    #render plain: params[:user].inspect
    devise_parameter_sanitizer.permit(:account_update, keys: [:surname, :forme, :teacher])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
