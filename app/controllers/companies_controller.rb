class CompaniesController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @user = current_user

    if @user.admin?
      @companies = Company.all
    else
      @companies = Company.where(status: true)
    end
  end

  def show; end

  def new
    @user = current_user
    @company = Company.new
  end

  def edit
    @user = current_user
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: 'Company was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if !@user.admin?
      params[:company].delete(:status)
    end

    if @company.update(company_params)
      redirect_to companies_path, notice: 'Company was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @company.update(status: false)
    redirect_to companies_path, notice: 'Company was successfully destroyed.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :status)
  end
end
