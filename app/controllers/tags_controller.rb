class TagsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @user = current_user

    if @user.admin?
      @tags = Tag.all
    else
      @tags = Tag.where(status: true)
    end
  end

  def show; end

  def new
    @user = current_user
    @tag = Tag.new
  end

  def edit
    @user = current_user
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: 'Tag was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if !@user.admin?
      params[:tag].delete(:status)
    end

    if @tag.update(tag_params)
      redirect_to tags_path, notice: 'Tag was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @tag.update(status: false)
    redirect_to tags_path, notice: 'Tag was successfully destroyed.'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :description, :color, :status)
  end
end
