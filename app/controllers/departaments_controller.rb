class DepartamentsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_departament, only: %i[show edit update destroy]

  def index
    @user = current_user

    @departaments = if @user.admin?
                      Departament.all
                    else
                      Departament.where(status: true)
                    end
  end

  def show; end

  def new
    @user = current_user
    @departament = Departament.new
  end

  def edit
    @user = current_user
  end

  def create
    @departament = Departament.new(departament_params)
    return unless @departament.save

    redirect_to departaments_path
    flash[:success] = 'Departament was successfully created.'
  end

  def update
    @user = current_user
    params[:departament].delete(:status) unless @user.admin?
    return unless @departament.update(departament_params)

    redirect_to departaments_path
    flash[:success] = 'Departament was successfully updated.'
  end

  def destroy
    @user = current_user
    @departament.update(status: false)
    redirect_to departaments_path
    flash[:success] = 'Departament was successfully destroyed.'
  end

  private

  def set_departament
    @departament = Departament.find(params[:id])
  end

  def departament_params
    params.require(:departament).permit(:name, :description, :status)
  end
end
