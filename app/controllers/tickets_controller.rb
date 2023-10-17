class TicketsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @user = current_user
    @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new
    @tags = Tag.all
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @company = @ticket.company_id
    @user = current_user
    @tags = Tag.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.name_user = current_user.name
    @ticket.avatar_user = current_user.avatar.attached? ? url_for(current_user.avatar) : nil
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to tickets_path, notice: 'Ticket was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @ticket.update(status: false)
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :category_id, :priority_id, :column_id, :company_id,
                                   :departament_id, :user_id, :date_end, :automation_hours, :execution_hours, :name_user, :avatar_user, tag_ids:[])
  end
end
