class CommentsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.new
  end

  def create
    @ticket = Ticket.find(params[:comment][:ticket_id])
    @comment = @ticket.comments.new(comment_params)

    if @comment.save
      redirect_to request.referrer || root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer || root_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title)
  end
end
