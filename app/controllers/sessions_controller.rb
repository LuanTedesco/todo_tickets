class SessionsController < Devise::SessionsController
  before_action :check_status, only: [:create]

  private

  def check_status
    user = User.find_by(email: params[:user][:email])

    return unless user && !user.status

    flash[:alert] = 'Sua conta está desativada. Entre em contato com o suporte.'
    redirect_to new_user_session_path
  end
end
