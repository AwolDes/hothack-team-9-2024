class ExpensesController < ApplicationController

  require 'csv'
  
  def index
    @tour = Tour.find(params[:id])
    @expenses = Expense.where(tour_id:params[:id])
    # ap @tour
    # ap @expenses
  end

  def new
    @tour = Tour.find(params[:id])
    @expense = Expense.new
  end

  def create
    ap "paaaraaams id"
    # why is params[:id] not returned for tour id from url?
    ap params[:id]
    
    post_data = params.require(:expense).permit(
      :date,
      :city,
      :cost,
      :state,
      :category,
      :tour_id,
    )

    ap "post data paraaams"
    ap post_data

    @expense = Expense.new(post_data)
    

    if @expense.save
      # fix this to by dynamic tours id how to extract from post_data?
      @url = '/tours/1/expenses'
      # ap "url redirect"
      # ap @url
      redirect_to @url
    else
      render :new, status: :unprocessable_entity
    end

  end

  def import

    @tour = Tour.find(params[:id])
    @url = '/tours/1/expenses'
    ap params
    ap "paraaaams"
    ap params[:file]
    file = params[:file]
    # return redirect_to expenses_path, notice: "Only CSV files" unless params[:file].content_type == "text/csv"

    if file 
      file = File.open(file)
      csv =  CSV.parse(file, headers: true, col_sep: ';')
      csv.each do |row|
        expense_hash = {}
        expense_hash[:city] = row["City"]
        ap expense_hash
        ap "expense_hash ###"
        p row
      end
      ap "CSV contents ... "
      ap csv

      if params[:file].present?
        Expense.import(params[:file])
        flash[:notice] = "CSV uploaded successfully"
        # redirect_to @url #expense_path
      else
        # redirect_to @url #expense_path
      end
    end
  end

end
