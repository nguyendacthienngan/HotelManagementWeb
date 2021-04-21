require "application_system_test_case"

class IntegerParametersTest < ApplicationSystemTestCase
  setup do
    @integer_parameter = integer_parameters(:one)
  end

  test "visiting the index" do
    visit integer_parameters_url
    assert_selector "h1", text: "Integer Parameters"
  end

  test "creating a Integer parameter" do
    visit integer_parameters_url
    click_on "New Integer Parameter"

    fill_in "Param name", with: @integer_parameter.param_name
    fill_in "Param value", with: @integer_parameter.param_value
    click_on "Create Integer parameter"

    assert_text "Integer parameter was successfully created"
    click_on "Back"
  end

  test "updating a Integer parameter" do
    visit integer_parameters_url
    click_on "Edit", match: :first

    fill_in "Param name", with: @integer_parameter.param_name
    fill_in "Param value", with: @integer_parameter.param_value
    click_on "Update Integer parameter"

    assert_text "Integer parameter was successfully updated"
    click_on "Back"
  end

  test "destroying a Integer parameter" do
    visit integer_parameters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Integer parameter was successfully destroyed"
  end
end
