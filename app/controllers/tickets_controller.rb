class TicketsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def edit; end

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
    @ticket.destroy
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :category_id, :priority_id, :column_id, :company_id,
                                   :departament_id, :user_id, :date_end, :automation_hours, :execution_hours, :name_user, :avatar_user, files: [])
  end
end
