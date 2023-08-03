class SubTasksController < ApplicationController
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

    respond_to do |format|
      if @sub_task.save
        format.html { redirect_to sub_task_url(@sub_task), notice: 'Sub task was successfully created.' }
        format.json { render :show, status: :created, location: @sub_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sub_task.update(sub_task_params)
        format.html { redirect_to sub_task_url(@sub_task), notice: 'Sub task was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sub_task.destroy

    respond_to do |format|
      format.html { redirect_to sub_tasks_url, notice: 'Sub task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sub_task
    @sub_task = SubTask.find(params[:id])
  end

  def sub_task_params
    params.require(:sub_task).permit(:name, :date_end)
  end
end
