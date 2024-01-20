class ExpenseController < ApplicationController



  def add
    ap params[:id]
    @tour = Tour.find(params[:id])

    @expense = Expense.new
    ap @tour
  end

  def create
    @tour = Tour.find(params[:id])
    @expense = Expense.new
    ap @tour
  end


  def upload
    # @tour = Tour.first
    @tour = Tour.find(params[:id])
    # @expenses = Expense.where(id: 1)
    @expenses = Expense.first
    ap @expenses
    ap "ap helllllloooo"
    puts "helllllloooo"
    puts @expenses
    # @expenses = 
  end

  def import_data
    if params[:file].present?
      Expense.import(params[:file])
      flash[:notice] = "CSV uploaded successfully"
      redirect_to expense_path
    else
      redirect_to expense_path
    end
  end

end
