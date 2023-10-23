class NotificationsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_notification, only: %i[ show edit update destroy ]

  def index
    user_department_id = current_user.departament_id
    @notifications = current_user.notifications.where(status: true).joins(:ticket).where(tickets: { departament_id: user_department_id })
    @notifications = @notifications.order(:created_at)
    order_filters
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      redirect_to notifications_path
      flash[:success] = "Notification was successfully created."
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to notifications_path
      flash[:success] = "Notification was successfully updated."
    end
  end

  def destroy
    @user = current_user
    if @user.admin?
      @notification.update(status: false)

      redirect_to notifications_path
      flash[:success] = "Notification was successfully destroyed."
    end
  end

  private

  def order_filters
    @notifications = @notifications.where('LOWER(notifications.title) LIKE ?', "%#{params[:filter_title]}%") if params[:filter_title].present?
    @notifications = @notifications.where('LOWER(notifications.description) LIKE ?', "%#{params[:filter_description]}%") if params[:filter_description].present?
    if params[:filter_date_start].present? && params[:filter_date_end].present?
      start_date = Date.parse(params[:filter_date_start])
      end_date = Date.parse(params[:filter_date_end]).end_of_day  # Inclui a data final completa
      @notifications = @notifications.where('DATE(notifications.created_at) BETWEEN ? AND ?', start_date, end_date)
    end
  end

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :description, :status, :ticket_id, :user_id, :departament_id)
  end
end
