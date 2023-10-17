class AttachmentsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_attachment, only: %i[show edit update destroy]


  def index
    @user = current_user

    if @user.admin?
      @attachments = Attachment.all
    else
      @attachments = Attachment.where(status: true)
    end
  end

  def show; end

  def new
    @user = current_user
    @ticket = Ticket.find(params[:ticket_id])
    @attachment = Attachment.new
  end

  def edit
    @user = current_user
    @ticket = @attachment.ticket
  end

  def create
    @ticket = Ticket.find(params[:attachment][:ticket_id])
    @attachment = Attachment.new(attachment_params)

    if @attachment.save
      redirect_to request.referrer || root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if !@user.admin?
      params[:attachment].delete(:status)
    end

    if @attachment.update(attachment_params)
      redirect_to request.referrer || root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @attachment.update(status: false)
    redirect_to request.referrer || root_path
  end

  private

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:name, :description, :status, :file, :ticket_id)
  end
end
