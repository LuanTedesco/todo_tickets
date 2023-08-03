class PrioritiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_priority, only: %i[show edit update destroy]

  def index
    @priorities = Priority.all
  end

  def show; end

  def new
    @priority = Priority.new
  end

  def edit; end

  def create
    @priority = Priority.new(priority_params)

    respond_to do |format|
      if @priority.save
        format.html { redirect_to priority_url(@priority), notice: 'Priority was successfully created.' }
        format.json { render :show, status: :created, location: @priority }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @priority.update(priority_params)
        format.html { redirect_to priority_url(@priority), notice: 'Priority was successfully updated.' }
        format.json { render :show, status: :ok, location: @priority }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @priority.destroy

    respond_to do |format|
      format.html { redirect_to priorities_url, notice: 'Priority was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_priority
    @priority = Priority.find(params[:id])
  end

  def priority_params
    params.require(:priority).permit(:title, :description, :level)
  end
end
