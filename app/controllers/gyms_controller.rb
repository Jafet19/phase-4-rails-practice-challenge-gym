class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_respond

    def index
        gym = Gym.all
        render json: gym
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy 
        gym = Gym.find(params[:id])
        gym.destroy
        # head: no_content
    end

    private

    # def render_not_found_respond => invalid
    #     render json: {error: e.record.errors.full_messages}, status: :not_found
    # end
end
