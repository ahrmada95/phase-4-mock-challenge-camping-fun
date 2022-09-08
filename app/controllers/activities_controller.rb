class ActivitiesController < ApplicationController

    def index 
        render json: Activity.all
    end

    def destroy
        destroy_me = Activity.find_by(id: params[:id])
        if(destroy_me)
            destroy_me.destroy
            render json: destroy_me
        else
            render json: {error: "Activity not found"}, status: 404
        end
    end
end
