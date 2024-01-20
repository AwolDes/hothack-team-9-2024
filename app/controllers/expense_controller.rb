class ExpenseController < ApplicationController

  def upload
    @tour = Tour.first
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
