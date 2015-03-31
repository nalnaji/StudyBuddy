class RegistrationsController < Devise::RegistrationsController
  protected

  # You can put the params you want to permit in the empty array.
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # You can put the params you want to permit in the empty array.
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end
