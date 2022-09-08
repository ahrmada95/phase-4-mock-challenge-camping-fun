class CampersController < ApplicationController

    def index 
        render json: Camper.all
    end

    def show
        if(camper = Camper.find_by(id: params[:id])) 
            render json: camper.to_json(methods: [:activities]) #weird syntax, but correct?
        else 
            render json: {error: "Camper not found"}, status: 404
        end
    end

    def create
        if(new_camper = Camper.create(name: params[:name], age: params[:age], difficulty: params[:difficulty]))
        else
            render json: {error: "validation errors"}, status: 422
        end
    end
end
