require 'test_helper'

class CarTrackerControllerTest < ActionDispatch::IntegrationTest
  test "should get update_position" do
    get car_tracker_update_position_url
    assert_response :success
  end



end
