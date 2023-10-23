class NotificationsController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_notification, only: %i[ show edit update destroy ]

  def index
    user_department_id = current_user.departament_id
    @notifications = current_user.notifications.where(status: true).joins(:ticket)
                             .where(tickets: { departament_id: user_department_id })
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
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:title, :description, :status, :ticket_id, :user_id, :departament_id)
    end
end
