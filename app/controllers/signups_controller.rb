class SignupsController < ApplicationController

    def create
        new_signup = Signup.create(camper_id: params[:camper_id], activity_id: params[:activity_id], time: params[:time])
        if(new_signup)
            render json: new_signup.activity, status: 201
        else 
            render json: {errors: ["validation errors"]}, status: 422
        end
    end
end
