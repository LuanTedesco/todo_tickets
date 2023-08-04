class SubTasksController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_sub_task, only: %i[show edit update destroy]

  def index
    @sub_tasks = SubTask.all
  end

  def show; end

  def new
    @sub_task = SubTask.new
  end

  def edit; end

  def create
    @sub_task = SubTask.new(sub_task_params)
    if @sub_task.save
      redirect_to sub_tasks_path, notice: 'Sub task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sub_task.update(sub_task_params)
      redirect_to sub_tasks_path, notice: 'Sub task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sub_task.destroy
    redirect_to sub_tasks_path, notice: 'Sub task was successfully destroyed.'
  end

  private

  def set_sub_task
    @sub_task = SubTask.find(params[:id])
  end

  def sub_task_params
    params.require(:sub_task).permit(:name, :date_end)
  end
end
