class UsersController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :authorize_admin, only: %i[index new create edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Usuário excluído com sucesso!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :departament_id, :password, :password_confirmation, :admin)
  end

  def authorize_admin
    return if current_user&.admin?

    flash[:alert] = 'Apenas administradores podem realizar esta ação.'
    redirect_to root_path
  end
end
