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

      if @ticket.save
        redirect_to tickets_path, notice: 'Ticket was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :category_id, :priority_id, :column_id, :company_id,
                                   :departament_id, :date_end, :automation_hours, :execution_hours, attachments: [ :tempfile, :content_type, :original_filename, :headers ])
  end
end
