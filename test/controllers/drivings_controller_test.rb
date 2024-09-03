require "test_helper"

class DrivingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driving = drivings(:one)
  end

  test "should get index" do
    get drivings_url
    assert_response :success
  end

  test "should get new" do
    get new_driving_url
    assert_response :success
  end

  test "should create driving" do
    assert_difference("Driving.count") do
      post drivings_url, params: { driving: { driver_id: @driving.driver_id, vehicle_id: @driving.vehicle_id } }
    end

    assert_redirected_to driving_url(Driving.last)
  end

  test "should show driving" do
    get driving_url(@driving)
    assert_response :success
  end

  test "should get edit" do
    get edit_driving_url(@driving)
    assert_response :success
  end

  test "should update driving" do
    patch driving_url(@driving), params: { driving: { driver_id: @driving.driver_id, vehicle_id: @driving.vehicle_id } }
    assert_redirected_to driving_url(@driving)
  end

  test "should destroy driving" do
    assert_difference("Driving.count", -1) do
      delete driving_url(@driving)
    end

    assert_redirected_to drivings_url
  end
end
