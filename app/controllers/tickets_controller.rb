class TicketsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!, :set_created_filter, :set_tags
  before_action :set_ticket

  def index
    @tickets = Ticket.all
    puts "\n\n#{params}\n\n"
    order_filters
  end

  def show; end

  def new; end

  def edit; end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.name_user = @user.name
    @ticket.avatar_user = @user.avatar.attached? ? url_for(@user.avatar) : nil
    if @ticket.save
      redirect_to edit_ticket_path(@ticket), notice: 'Ticket was successfully created and is ready for editing.'
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
    @ticket.update(status: false)
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private
  def set_tags
    @tags = Tag.all
  end

  def set_created_filter
    @created_filter = params[:date_filter_type].eql?('Created date') ? "DATE(created_at) between ? and ?" : "DATE(date_end) between ? and ?" unless params[:date_filter_type].blank?
  end

  def order_filters
    @tickets = @tickets.where('LOWER(title) LIKE ?', "%#{params[:filter_title]}%") if params[:filter_title].present?
    @tickets = @tickets.where(category: params[:filter_category]) if params[:filter_category].present?
    @tickets = @tickets.where(priority: params[:filter_priority]) if params[:filter_priority].present?
    @tickets = @tickets.where(departament: params[:filter_departament]) if params[:filter_departament].present?
    @tickets = @tickets.where(company_id: params[:filter_company]) if params[:filter_company].present?
    @tickets = @tickets.where(user_id: params[:filter_user]) if params[:filter_user].present?
    @tickets = @tickets.where(tag: params[:filter_tag]) if params[:filter_tag].present?
    @tickets = @tickets.where(@created_filter, Date.parse(params[:filter_date_start]), Date.parse(params[:filter_date_end])) if params[:filter_date_start].present? && params[:filter_date_end].present?
  end

  def set_ticket
    @ticket = Ticket.find(params[:id]) rescue Ticket.new
  end

  def ticket_params
    params
      .require(:ticket)
      .permit(
        :title,
        :description,
        :category_id,
        :priority_id,
        :column_id,
        :company_id,
        :departament_id,
        :user_id,
        :date_end,
        :automation_hours,
        :execution_hours,
        :name_user,
        :avatar_user,
        tag_ids:[]
      )
  end
end
