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

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to attachment_url(@attachment), notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to attachment_url(@attachment), notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:title, :description, :url)
  end
end
