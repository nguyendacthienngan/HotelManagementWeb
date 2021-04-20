require "application_system_test_case"

class RoomTypesTest < ApplicationSystemTestCase
  setup do
    @room_type = room_types(:one)
  end

  test "visiting the index" do
    visit room_types_url
    assert_selector "h1", text: "Room Types"
  end

  test "creating a Room type" do
    visit room_types_url
    click_on "New Room Type"

    fill_in "Add adult price", with: @room_type.add_adult_price
    fill_in "Add child price", with: @room_type.add_child_price
    fill_in "Date price", with: @room_type.date_price
    fill_in "Description", with: @room_type.description
    fill_in "Hour price", with: @room_type.hour_price
    fill_in "Month price", with: @room_type.month_price
    fill_in "Name", with: @room_type.name
    fill_in "Past night price", with: @room_type.past_night_price
    fill_in "Week price", with: @room_type.week_price
    click_on "Create Room type"

    assert_text "Room type was successfully created"
    click_on "Back"
  end

  test "updating a Room type" do
    visit room_types_url
    click_on "Edit", match: :first

    fill_in "Add adult price", with: @room_type.add_adult_price
    fill_in "Add child price", with: @room_type.add_child_price
    fill_in "Date price", with: @room_type.date_price
    fill_in "Description", with: @room_type.description
    fill_in "Hour price", with: @room_type.hour_price
    fill_in "Month price", with: @room_type.month_price
    fill_in "Name", with: @room_type.name
    fill_in "Past night price", with: @room_type.past_night_price
    fill_in "Week price", with: @room_type.week_price
    click_on "Update Room type"

    assert_text "Room type was successfully updated"
    click_on "Back"
  end

  test "destroying a Room type" do
    visit room_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room type was successfully destroyed"
  end
end
