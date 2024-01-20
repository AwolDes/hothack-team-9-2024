class DataVisController < ApplicationController
    def data_view
        #overall tour information
        @tour_name = Tour.find_by(id: 7)&.name
        @expenses = Expense.where(tour_id: 7)
    end

end
