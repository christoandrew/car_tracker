class CarTrackerController < ApplicationController
  skip_before_action :verify_authenticity_token

  ## Request Format
  # POST /car_tracker/update_position/
  # Accept: application/json
  # Content-Type: application/json
  # {
  #   "position": {
  #     "car_id": 1,
  #     "lat": 1.1231,
  #     "long": 10.00
  #   }
  # }
  # #
  def update_position
    respond_to do |format|
      position = params[:position]
      car_id = position[:car_id]
      car = Car.where(id: car_id)&.first
      if car.nil?
        format.json { render json: { error: "Car with id #{car_id} does not exist" }, status: 404 }
      else
        car.car_positions.create(lat: position[:lat], long: position[:long])
        format.json { render json: { message: "Updated car position successfully" }, status: 200 }
      end
    end
  end

  ## Request Format
  # GET /car_tracker/get_positions/
  # Accept: application/json
  # Content-Type: application/json
  # {
  #   "car_id": 2
  # }
  # #
  def get_positions
    positions = CarPosition.where(car_id: params[:car_id]).order(created_at: :asc)
    respond_to do |format|
      format.json { render json: positions }
    end
  end
end
