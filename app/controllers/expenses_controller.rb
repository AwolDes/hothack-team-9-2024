class ExpensesController < ApplicationController
  
  def index
  end


  def new
    @expenses = Expenses.new
  end

  def create

    puts params[:id]


    @expenses = Expenses.new(date: "20/01/2024", city: "Brisbane")

    if @expenses.save
      redirect_to @expenses
    end

    # expenses.create(params[:id])
    # expenses.import(params[:file])
    # redirect_to root_url, notice: "Expenses Data imported"
    # redirect_to root_url, alert: { params[:id]}

  end

  def import_data
    if params[:file].present?
      Expenses.import(params[:file])
      flash[:notice] = "CSV uploaded successfully"
      redirect_to import_expenses_path
    else
      redirect_to import_expenses_path
    end
  end

end
