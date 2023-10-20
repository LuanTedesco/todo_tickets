class SubTasksController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_sub_task, only: %i[show edit update destroy]

  def index
    @user = current_user

    @sub_tasks = if @user.admin?
                   SubTask.all
                 else
                   SubTask.where(status: true)
                 end
  end

  def show; end

  def new
    @user = current_user
    @ticket = Ticket.find(params[:ticket_id])
    @sub_task = SubTask.new
  end

  def edit
    @user = current_user
    @ticket = @sub_task.ticket
  end

  def create
    @ticket = Ticket.find(params[:sub_task][:ticket_id])
    @sub_task = @ticket.sub_tasks.new(sub_task_params)

    return unless @sub_task.save

    redirect_to request.referrer || root_path
    flash[:success] = 'Sub task was successfully created.'
  end

  def update
    @user = current_user
    params[:sub_task].delete(:status) unless @user.admin?

    return unless @sub_task.update(sub_task_params)

    redirect_to request.referrer || root_path
    flash[:success] = 'Sub task was successfully updated.'
  end

  def destroy
    @user = current_user
    @sub_task.update(status: false)
    redirect_to request.referrer || root_path
    flash[:success] = 'Sub task was successfully destroyed.'
  end

  private

  def set_sub_task
    @sub_task = SubTask.find(params[:id])
  end

  def sub_task_params
    params.require(:sub_task).permit(:title, :description, :date_end, :finished, :finished_at, :status)
  end
end
