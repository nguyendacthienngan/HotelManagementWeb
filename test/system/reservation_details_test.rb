require "application_system_test_case"

class ReservationDetailsTest < ApplicationSystemTestCase
  setup do
    @reservation_detail = reservation_details(:one)
  end

  test "visiting the index" do
    visit reservation_details_url
    assert_selector "h1", text: "Reservation Details"
  end

  test "creating a Reservation detail" do
    visit reservation_details_url
    click_on "New Reservation Detail"

    fill_in "Date charged", with: @reservation_detail.date_charged
    fill_in "Quantity", with: @reservation_detail.quantity
    fill_in "Total", with: @reservation_detail.total
    click_on "Create Reservation detail"

    assert_text "Reservation detail was successfully created"
    click_on "Back"
  end

  test "updating a Reservation detail" do
    visit reservation_details_url
    click_on "Edit", match: :first

    fill_in "Date charged", with: @reservation_detail.date_charged
    fill_in "Quantity", with: @reservation_detail.quantity
    fill_in "Total", with: @reservation_detail.total
    click_on "Update Reservation detail"

    assert_text "Reservation detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation detail" do
    visit reservation_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation detail was successfully destroyed"
  end
end
