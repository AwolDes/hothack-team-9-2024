class ToursController < ApplicationController

    def index
        #todo change query when auth is merged.
        @tours = Tour.all
    end

    def add_tour
    end

    # This method recivies http requests for adding tours.
    def create_tour
        post_data = params.permit(:name, :start_date, :finish_date, :budget)
    
        new_tour = Tour.new(post_data)
        
        # Send a reponse to the client, to let it know whether or not the request went through.
        if new_tour.save
            render json: { status: 'success', data: new_tour }
          else
            render json: { status: 'error', errors: new_tour.errors.full_messages }
          end
    end


end
