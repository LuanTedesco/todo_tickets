class DepartamentsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_departament, only: %i[show edit update destroy]

  def index
    @departaments = Departament.all
  end

  def show; end

  def new
    @departament = Departament.new
  end

  def edit; end

  def create
    @departament = Departament.new(departament_params)
    if @departament.save
      redirect_to departaments_path, notice: 'Departament was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @departament.update(departament_params)
      redirect_to departaments_path, notice: 'Departament was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @departament.destroy
    redirect_to departaments_path, notice: 'Departament was successfully destroyed.'
  end

  private

  def set_departament
    @departament = Departament.find(params[:id])
  end

  def departament_params
    params.require(:departament).permit(:name, :description, :status)
  end
end
