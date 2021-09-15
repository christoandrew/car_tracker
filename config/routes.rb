Rails.application.routes.draw do
  post 'car_tracker/update_position'
  get 'car_tracker/get_positions'
end
