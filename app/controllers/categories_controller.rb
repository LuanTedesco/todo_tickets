class CategoriesController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @user = current_user

    @categories = if @user.admin?
                    Category.where(departament_id: current_user.departament_id)
                  else
                    Category.where(departament_id: current_user.departament_id, status: true)
                  end
  end

  def show; end

  def new
    @user = current_user
    @category = Category.new
  end

  def edit
    @user = current_user
  end

  def create
    @category = Category.new(category_params)
    @category.departament_id = current_user.departament_id
    return unless @category.save

    redirect_to categories_path
    flash[:success] = 'Category was successfully created.'
  end

  def update
    @user = current_user
    params[:category].delete(:status) unless @user.admin?

    return unless @category.update(category_params)

    redirect_to categories_path
    flash[:success] = 'Category was successfully updated.'
  end

  def destroy
    @user = current_user
    @category.update(status: false)
    redirect_to categories_path
    flash[:success] = 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :status)
  end
end
