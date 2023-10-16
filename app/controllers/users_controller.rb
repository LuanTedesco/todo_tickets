class UsersController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path, alert: 'Você não tem permissão para visualizar a lista de usuários.'
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit
    unless current_user == @user || current_user.admin?
      redirect_to root_path, alert: 'Você não tem permissão para realizar esta ação.'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'Usuário criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.admin?
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      params[:user].delete(:status)
      params[:user].delete(:admin)

      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Usuário excluído com sucesso.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :departament_id, :password, :password_confirmation, :status, :admin, :avatar)
  end
end
