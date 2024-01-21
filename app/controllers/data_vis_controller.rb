class DataVisController < ApplicationController
    def data_view
        tour_id = params[:id]
        #overall tour information
        @tour = Tour.find_by(id: tour_id)
        @tour_name = @tour&.name
        @expenses_tour = Expense.where(tour_id: tour_id)
        

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
        @comparison_data = @tour_costs.map do |category, actual_cost|
            {
                name: category.capitalize,
                data: {
                    'Actual Cost' => actual_cost,
                    'Average Cost' => @avg_category_expense.to_h[category]&.last || 0
                }
            }
        end
    end
end
