require "application_system_test_case"

class DriversTest < ApplicationSystemTestCase
  setup do
    @driver = drivers(:one)
  end

  test "visiting the index" do
    visit drivers_url
    assert_selector "h1", text: "Drivers"
  end

  test "should create driver" do
    visit drivers_url
    click_on "New driver"

    fill_in "Endereco", with: @driver.endereco
    fill_in "Login", with: @driver.login
    fill_in "Matricula", with: @driver.matricula
    fill_in "Nome", with: @driver.nome
    fill_in "Senha", with: @driver.senha
    fill_in "Telefone", with: @driver.telefone
    click_on "Create Driver"

    assert_text "Driver was successfully created"
    click_on "Back"
  end

  test "should update Driver" do
    visit driver_url(@driver)
    click_on "Edit this driver", match: :first

    fill_in "Endereco", with: @driver.endereco
    fill_in "Login", with: @driver.login
    fill_in "Matricula", with: @driver.matricula
    fill_in "Nome", with: @driver.nome
    fill_in "Senha", with: @driver.senha
    fill_in "Telefone", with: @driver.telefone
    click_on "Update Driver"

    assert_text "Driver was successfully updated"
    click_on "Back"
  end

  test "should destroy Driver" do
    visit driver_url(@driver)
    click_on "Destroy this driver", match: :first

    assert_text "Driver was successfully destroyed"
  end
end
