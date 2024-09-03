require "application_system_test_case"

class PayloadsTest < ApplicationSystemTestCase
  setup do
    @payload = payloads(:one)
  end

  test "visiting the index" do
    visit payloads_url
    assert_selector "h1", text: "Payloads"
  end

  test "should create payload" do
    visit payloads_url
    click_on "New payload"

    click_on "Create Payload"

    assert_text "Payload was successfully created"
    click_on "Back"
  end

  test "should update Payload" do
    visit payload_url(@payload)
    click_on "Edit this payload", match: :first

    click_on "Update Payload"

    assert_text "Payload was successfully updated"
    click_on "Back"
  end

  test "should destroy Payload" do
    visit payload_url(@payload)
    click_on "Destroy this payload", match: :first

    assert_text "Payload was successfully destroyed"
  end
end
