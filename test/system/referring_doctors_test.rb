require "application_system_test_case"

class ReferringDoctorsTest < ApplicationSystemTestCase
  setup do
    @referring_doctor = referring_doctors(:one)
  end

  test "visiting the index" do
    visit referring_doctors_url
    assert_selector "h1", text: "Referring Doctors"
  end

  test "creating a Referring doctor" do
    visit referring_doctors_url
    click_on "New Referring Doctor"

    fill_in "Address", with: @referring_doctor.address
    fill_in "Email", with: @referring_doctor.email
    fill_in "Name", with: @referring_doctor.name
    fill_in "Phone", with: @referring_doctor.phone
    click_on "Create Referring doctor"

    assert_text "Referring doctor was successfully created"
    click_on "Back"
  end

  test "updating a Referring doctor" do
    visit referring_doctors_url
    click_on "Edit", match: :first

    fill_in "Address", with: @referring_doctor.address
    fill_in "Email", with: @referring_doctor.email
    fill_in "Name", with: @referring_doctor.name
    fill_in "Phone", with: @referring_doctor.phone
    click_on "Update Referring doctor"

    assert_text "Referring doctor was successfully updated"
    click_on "Back"
  end

  test "destroying a Referring doctor" do
    visit referring_doctors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referring doctor was successfully destroyed"
  end
end
