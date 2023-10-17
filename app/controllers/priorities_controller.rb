class PrioritiesController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_priority, only: %i[show edit update destroy]

  def index
    @user = current_user

    if @user.admin?
      @priorities = Priority.all
    else
      @priorities = Priority.where(status: true)
    end
  end

  def show; end

  def new
    @user = current_user
    @priority = Priority.new
  end

  def edit
    @user = current_user
  end

  def create
    @priority = Priority.new(priority_params)
    if @priority.save
      redirect_to priorities_path, notice: 'Priority was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if !@user.admin?
      params[:priority].delete(:status)
    end

    if @priority.update(priority_params)
      redirect_to priorities_path, notice: 'Priority was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @priority.update(status: false)
    redirect_to priorities_path, notice: 'Priority was successfully destroyed.'
  end

  private

  def set_priority
    @priority = Priority.find(params[:id])
  end

  def priority_params
    params.require(:priority).permit(:name, :description, :level, :status)
  end
end
