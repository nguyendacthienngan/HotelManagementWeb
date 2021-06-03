require "application_system_test_case"

class RoomPricesTest < ApplicationSystemTestCase
  setup do
    @room_price = room_prices(:one)
  end

  test "visiting the index" do
    visit room_prices_url
    assert_selector "h1", text: "Room Prices"
  end

  test "creating a Room price" do
    visit room_prices_url
    click_on "New Room Price"

    fill_in "Begin date", with: @room_price.begin_date
    fill_in "End date", with: @room_price.end_date
    check "Is available" if @room_price.is_available
    fill_in "Price", with: @room_price.price
    fill_in "Price type", with: @room_price.price_type
    click_on "Create Room price"

    assert_text "Room price was successfully created"
    click_on "Back"
  end

  test "updating a Room price" do
    visit room_prices_url
    click_on "Edit", match: :first

    fill_in "Begin date", with: @room_price.begin_date
    fill_in "End date", with: @room_price.end_date
    check "Is available" if @room_price.is_available
    fill_in "Price", with: @room_price.price
    fill_in "Price type", with: @room_price.price_type
    click_on "Update Room price"

    assert_text "Room price was successfully updated"
    click_on "Back"
  end

  test "destroying a Room price" do
    visit room_prices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room price was successfully destroyed"
  end
end
