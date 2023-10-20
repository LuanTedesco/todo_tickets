class UsersController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path
      flash[:alert] = 'You do not have permission to view the user list.'
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit
    return if current_user == @user || current_user.admin?

    redirect_to root_path
    flash[:alert] = 'You do not have permission to perform this action.'
  end

  def create
    @user = User.new(user_params)

    unless @user.avatar.present?
      @user.avatar.attach(io: File.open('app/assets/images/default-avatar.png'), filename: 'default-avatar.png',
                          content_type: 'image/png')
    end

    return unless @user.save

    redirect_to users_path
    flash[:success] = 'User was successfully created.'
  end

  def update
    if current_user.admin? || !params[:user][:admin].nil?
      params[:user].delete(:status) if !current_user.admin? && params[:user][:status].present?

      if @user.update(user_params)
        redirect_to users_path
        flash[:success] = 'User was successfully updated.'
      end
    else
      redirect_to users_path
      flash[:warning] = 'You do not have permission to perform this action.'
    end
  end

  def destroy
    @user.update(status: false)
    redirect_to users_path
    flash[:success] = 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :departament_id, :password, :password_confirmation, :status, :admin,
                                 :avatar)
  end
end
