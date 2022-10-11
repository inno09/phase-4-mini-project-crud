class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    def index
      render json: Spice.all
    end
  
    def show 
      spice = Spice.find_by(id: params[:id])
      if spice
        render json: spice
      else
        render json: { error: "Spice not found" }, status: :not_found
      end
    end
  
    def create 
      spice = Spice.create(spice_params)
      render json: spice, status: :created
    end
  
    def update
      spice = Spice.find_by(id: params[:id])
      spice.update(spice_params)
      render json: spice
    end
  
    def destroy 
      spice = Spice.find_by(id: params[:id])
      spice.destroy
      head :no_content
    end
  
    private
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
  
  end
