class DataVisController < ApplicationController
    def data_view
        tour_id = params[:id]
        #overall tour information
        @tour = Tour.find_by(id: tour_id)
        @tour_name = @tour&.name
        if params[:start_date] && params[:end_date]
            @expenses_tour = Expense.where(tour_id: tour_id, date: params[:start_date]..params[:end_date])
            # @expenses_tour = Expense.where(tour_id: tour_id, category: params[:category])
        else
            @expenses_tour = Expense.where(tour_id: tour_id)
        end
        
        #budget calculations
        tour_budget = @tour&.budget 
        total_expenses_cost = @expenses_tour.sum(:cost)
        percentage_of_budget = (total_expenses_cost / tour_budget) * 100

        @budget_chart = [
            ['Expenses', total_expenses_cost.round(2) ],
            ['Remaining Budget', (tour_budget - total_expenses_cost).round(2) ]
        ]
        @percentage_of_budget = percentage_of_budget.round(2)
        

        #benchmark averages
        category_expenses = Expense.group(:category).average(:cost)
        @avg_category_expense = category_expenses.map do |category, avg_cost|
            [category.capitalize, avg_cost.round(2)]
        end

        @tour_costs = @expenses_tour.group(:category).sum(:cost)
    end


    # select time period
    def group_by_day_chart
        @data = @expenses_tour.group_by_day(:date).sum(:cost)
        render_chart
    end
    
    def group_by_week_chart
        @data = @expenses_tour.group_by_week(:date).sum(:cost)
        render_chart
    end
    
    def group_by_month_chart
        @data = @expenses_tour.group_by_month(:date).sum(:cost)
        render_chart
    end
    
    private
    
    def render_chart
        respond_to do |format|
            format.html { render 'your_view' } # Add your view name here
        format.json { render json: @data }
        end
    end
end
