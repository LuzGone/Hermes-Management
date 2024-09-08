require "test_helper"

class TransportingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transporting = transportings(:one)
  end

  test "should get index" do
    get transportings_url
    assert_response :success
  end

  test "should get new" do
    get new_transporting_url
    assert_response :success
  end

  test "should create transporting" do
    assert_difference("Transporting.count") do
      post transportings_url, params: { transporting: { dataDespache: @transporting.dataDespache, dataEntrega: @transporting.dataEntrega, destino: @transporting.destino, order_id: @transporting.order_id, origem: @transporting.origem, vehicle_id: @transporting.vehicle_id } }
    end

    assert_redirected_to transporting_url(Transporting.last)
  end

  test "should show transporting" do
    get transporting_url(@transporting)
    assert_response :success
  end

  test "should get edit" do
    get edit_transporting_url(@transporting)
    assert_response :success
  end

  test "should update transporting" do
    patch transporting_url(@transporting), params: { transporting: { dataDespache: @transporting.dataDespache, dataEntrega: @transporting.dataEntrega, destino: @transporting.destino, order_id: @transporting.order_id, origem: @transporting.origem, vehicle_id: @transporting.vehicle_id } }
    assert_redirected_to transporting_url(@transporting)
  end

  test "should destroy transporting" do
    assert_difference("Transporting.count", -1) do
      delete transporting_url(@transporting)
    end

    assert_redirected_to transportings_url
  end
end
