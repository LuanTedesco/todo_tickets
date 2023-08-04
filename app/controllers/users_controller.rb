class UsersController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :authorize_admin, only: %i[index new create edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params) # Usar o método "update" para salvar as alterações
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'Usuário excluído com sucesso!'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end

  def authorize_admin
    return if current_user&.admin?

    flash[:alert] = 'Apenas administradores podem realizar esta ação.'
    redirect_to root_path
  end
end
