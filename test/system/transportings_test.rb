require "application_system_test_case"

class TransportingsTest < ApplicationSystemTestCase
  setup do
    @transporting = transportings(:one)
  end

  test "visiting the index" do
    visit transportings_url
    assert_selector "h1", text: "Transportings"
  end

  test "should create transporting" do
    visit transportings_url
    click_on "New transporting"

    fill_in "Datadespache", with: @transporting.dataDespache
    fill_in "Dataentrega", with: @transporting.dataEntrega
    fill_in "Destino", with: @transporting.destino
    fill_in "Order", with: @transporting.order_id
    fill_in "Origem", with: @transporting.origem
    fill_in "Vehicle", with: @transporting.vehicle_id
    click_on "Create Transporting"

    assert_text "Transporting was successfully created"
    click_on "Back"
  end

  test "should update Transporting" do
    visit transporting_url(@transporting)
    click_on "Edit this transporting", match: :first

    fill_in "Datadespache", with: @transporting.dataDespache
    fill_in "Dataentrega", with: @transporting.dataEntrega
    fill_in "Destino", with: @transporting.destino
    fill_in "Order", with: @transporting.order_id
    fill_in "Origem", with: @transporting.origem
    fill_in "Vehicle", with: @transporting.vehicle_id
    click_on "Update Transporting"

    assert_text "Transporting was successfully updated"
    click_on "Back"
  end

  test "should destroy Transporting" do
    visit transporting_url(@transporting)
    click_on "Destroy this transporting", match: :first

    assert_text "Transporting was successfully destroyed"
  end
end
