class ColumnsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_column, only: %i[show edit update destroy]

  def index
    @user = current_user

    if @user.admin?
      @columns = Column.all
    else
      @columns = Column.where(status: true)
    end
  end

  def show; end

  def new
    @user = current_user
    @column = Column.new
  end

  def edit
    @user = current_user
  end

  def create
    @column = Column.new(column_params)

    if @column.save
      redirect_to columns_path, notice: 'Column was successfully created.'

    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if !@user.admin?
      params[:column].delete(:status)
    end
    if @column.update(column_params)
      redirect_to columns_path, notice: 'Column was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @column.update(status: false)
    redirect_to columns_path, notice: 'Column was successfully destroyed.'
  end

  private

  def set_column
    @column = Column.find(params[:id])
  end

  def column_params
    params.require(:column).permit(:title, :description, :level, :status, :visible)
  end
end
