require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Cpf cliente", with: @order.cpf_cliente
    fill_in "Danfe", with: @order.danfe
    fill_in "Endereco cliente", with: @order.endereco_cliente
    fill_in "Nfe", with: @order.nfe
    fill_in "Nome cliente", with: @order.nome_cliente
    fill_in "Nome fornecedor", with: @order.nome_fornecedor
    fill_in "Status pedido", with: @order.status_pedido
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Cpf cliente", with: @order.cpf_cliente
    fill_in "Danfe", with: @order.danfe
    fill_in "Endereco cliente", with: @order.endereco_cliente
    fill_in "Nfe", with: @order.nfe
    fill_in "Nome cliente", with: @order.nome_cliente
    fill_in "Nome fornecedor", with: @order.nome_fornecedor
    fill_in "Status pedido", with: @order.status_pedido
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
