class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @records = @category.records.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @record = @category.records.build
  end

  def create
    @category = Category.find(params[:category_id])
    @record = @category.records.build(record_params)
    @record.author = current_user

    if @record.save
      redirect_to category_records_path(@category), notice: 'Transaction was successfully added :)'
    else
      @errors = @record.errors.full_messages
      render :new, alert: @errors
    end
  end



  private

  def record_params
    params.require(:record).permit(:name, :amount, :category_ids)
  end
end
