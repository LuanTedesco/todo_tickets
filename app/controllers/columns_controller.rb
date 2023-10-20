class ColumnsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_column, only: %i[show edit update destroy]

  def index
    @user = current_user

    @columns = if @user.admin?
                 Column.all
               else
                 Column.where(status: true)
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

    return unless @column.save

    redirect_to columns_path
    flash[:success] = 'Column was successfully created.'
  end

  def update
    @user = current_user
    params[:column].delete(:status) unless @user.admin?
    return unless @column.update(column_params)

    redirect_to columns_path
    flash[:success] = 'Column was successfully updated.'
  end

  def destroy
    @user = current_user
    @column.update(status: false)
    redirect_to columns_path
    flash[:success] = 'Column was successfully destroyed.'
  end

  private

  def set_column
    @column = Column.find(params[:id])
  end

  def column_params
    params.require(:column).permit(:title, :description, :level, :status, :visible)
  end
end
