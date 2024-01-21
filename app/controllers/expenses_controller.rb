class ExpensesController < ApplicationController

  require 'csv'
  
  def index
    @tour = Tour.find(params[:id])
    @expenses = Expense.where(tour_id:params[:id])

  end

  def new
    @tour = Tour.find(params[:id])
    @expense = Expense.new
  end

  def create
    
    post_data = params.require(:expense).permit(
      :date,
      :city,
      :cost,
      :state,
      :category,
      :tour_id,
    )


    @expense = Expense.new(post_data)
    

    if @expense.save

      @url = '/tours/1/expenses'

      redirect_to @url
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @tour = Tour.find(params[:id])
  end

  def import

    file = params[:file]


    if file 
      
      if params[:file].present?
        Expense.import(params[:file])
        flash[:notice] = "CSV uploaded successfully"
        redirect_to tour_expenses_path(params[:tour_id])
      else
        flash[:notice] = "CSV errors"
      end
    end
  end

end
