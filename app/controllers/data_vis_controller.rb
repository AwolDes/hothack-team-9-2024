class DataVisController < ApplicationController
    def data_view
        #overall tour information
        @tour_name = Tour.find_by(id: 7)&.name
        @expenses_tour = Expense.where(tour_id: 7)
        @expenses_all = Expense.all

        #budget calculations
        tour_budget = Tour.find_by(id: 1)&.budget 
        total_expenses_cost = Expense.where(tour_id: 1).sum(:cost)
        percentage_of_budget = (total_expenses_cost / tour_budget) * 100
        puts "percentage budget: #{percentage_of_budget}"

        @budget_chart = [
            ['Expenses', total_expenses_cost.round(2) ],
            ['Remaining Budget', (tour_budget - total_expenses_cost).round(2) ]
        ]
        @percentage_of_budget = percentage_of_budget.round(2)
        
        #benchmark averages
        category_expenses = Expense.group(:category).average(:cost)

        # Format data for Chartkick
        @chart_data = category_expenses.map do |category, avg_cost|
            { name: category.capitalize, data: avg_cost.round(2) }
        
        end
    end
end
