class PrioritiesController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_priority, only: %i[show edit update destroy]

  def index
    @user = current_user

    @priorities = if @user.admin?
                    Priority.all
                  else
                    Priority.where(status: true)
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
    return unless @priority.save

    redirect_to priorities_path
    flash[:success] = 'Priority was successfully created.'
  end

  def update
    @user = current_user
    params[:priority].delete(:status) unless @user.admin?

    return unless @priority.update(priority_params)

    redirect_to priorities_path
    flash[:success] = 'Priority was successfully updated.'
  end

  def destroy
    @user = current_user
    @priority.update(status: false)
    redirect_to priorities_path
    flash[:success] = 'Priority was successfully destroyed.'
  end

  private

  def set_priority
    @priority = Priority.find(params[:id])
  end

  def priority_params
    params.require(:priority).permit(:name, :description, :level, :status)
  end
end
