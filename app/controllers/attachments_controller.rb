class AttachmentsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_attachment, only: %i[show edit update destroy]

  def index
    @attachments = Attachment.all
  end

  def show; end

  def new
    @attachment = Attachment.new
  end

  def edit; end

  def create
    @attachment = Attachment.new(attachment_params)

    if @attachment.save
      redirect_to attachments_path, notice: 'Attachment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @attachment.update(attachment_params)
      redirect_to attachments_path, notice: 'Attachment was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @attachment.destroy
    redirect_to attachments_path, notice: 'Attachment was successfully destroyed.'
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:title, :description, :status, :url)
  end
end
