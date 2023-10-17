class SubTasksController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_sub_task, only: %i[show edit update destroy]

  def index
    @user = current_user

    if @user.admin?
      @sub_tasks = SubTask.all
    else
      @sub_tasks = SubTask.where(status: true)
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

    if @sub_task.save
      redirect_to request.referrer || root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if !@user.admin?
      params[:sub_task].delete(:status)
    end

    if @sub_task.update(sub_task_params)
      redirect_to request.referrer || root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @sub_task.update(status: false)
    redirect_to sub_tasks_path, notice: 'Sub task was successfully destroyed.'
  end

  private

  def set_sub_task
    @sub_task = SubTask.find(params[:id])
  end

  def sub_task_params
    params.require(:sub_task).permit(:title, :description, :date_end, :status)
  end
end
