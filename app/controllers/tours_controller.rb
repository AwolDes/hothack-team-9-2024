class ToursController < ApplicationController

    # Authenticate user (redirect to login view if not signed in)
    before_action :authenticate_user!

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
            redirect_to action: 'index', controller: 'tours'
          else
            render json: { status: 'error', errors: new_tour.errors.full_messages }
          end
    end

    # This method deletes a tour from http request.
    # this not working cause of foreign key problem with the database
    def delete_tour
      tour_id = params.permit(:id)[:id]

      puts "\e[32mTour ID: #{tour_id}\e[0m"
    
      tour = Tour.find_by(id: tour_id)
    
      tour.delete

    end
    

end
