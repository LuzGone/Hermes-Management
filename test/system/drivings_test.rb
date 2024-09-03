require "application_system_test_case"

class DrivingsTest < ApplicationSystemTestCase
  setup do
    @driving = drivings(:one)
  end

  test "visiting the index" do
    visit drivings_url
    assert_selector "h1", text: "Drivings"
  end

  test "should create driving" do
    visit drivings_url
    click_on "New driving"

    fill_in "Driver", with: @driving.driver_id
    fill_in "Vehicle", with: @driving.vehicle_id
    click_on "Create Driving"

    assert_text "Driving was successfully created"
    click_on "Back"
  end

  test "should update Driving" do
    visit driving_url(@driving)
    click_on "Edit this driving", match: :first

    fill_in "Driver", with: @driving.driver_id
    fill_in "Vehicle", with: @driving.vehicle_id
    click_on "Update Driving"

    assert_text "Driving was successfully updated"
    click_on "Back"
  end

  test "should destroy Driving" do
    visit driving_url(@driving)
    click_on "Destroy this driving", match: :first

    assert_text "Driving was successfully destroyed"
  end
end
