class ColumnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_column, only: %i[show edit update destroy]

  def index
    @columns = Column.all
  end

  def show; end

  def new
    @column = Column.new
  end

  def edit; end

  def create
    @column = Column.new(column_params)

    respond_to do |format|
      if @column.save
        format.html { redirect_to column_url(@column), notice: 'Column was successfully created.' }
        format.json { render :show, status: :created, location: @column }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @column.update(column_params)
        format.html { redirect_to column_url(@column), notice: 'Column was successfully updated.' }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @column.destroy

    respond_to do |format|
      format.html { redirect_to columns_url, notice: 'Column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_column
    @column = Column.find(params[:id])
  end

  def column_params
    params.require(:column).permit(:title)
  end
end
