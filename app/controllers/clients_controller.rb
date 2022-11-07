class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_respond

    def index
        client = Client.all
        render json: client
    end
    
    def show
        client = Client.find(params[:id])
        render json: client
    end

    private
    
    def render_not_found_respond(e)
        # render json: {error: e.record.errors.full_messages}, status: :not_found #this is for invalid responses
        render json: e, status: :not_found
    end

end
