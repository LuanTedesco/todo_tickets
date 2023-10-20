class CompaniesController < ApplicationController
  layout 'application_tickets'
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @user = current_user

    @companies = if @user.admin?
                   Company.all
                 else
                   Company.where(status: true)
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
    return unless @company.save

    redirect_to companies_path
    flash[:success] = 'Company was successfully created.'
  end

  def update
    @user = current_user
    params[:company].delete(:status) unless @user.admin?

    return unless @company.update(company_params)

    redirect_to companies_path
    flash[:success] = 'Company was successfully updated.'
  end

  def destroy
    @user = current_user
    @company.update(status: false)
    redirect_to companies_path
    flash[:success] = 'Company was successfully destroyed.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :status)
  end
end
