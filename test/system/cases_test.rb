require "application_system_test_case"

class CasesTest < ApplicationSystemTestCase
  setup do
    @case = cases(:one)
  end

  test "visiting the index" do
    visit cases_url
    assert_selector "h1", text: "Cases"
  end

  test "creating a Case" do
    visit cases_url
    click_on "New Case"

    fill_in "Doctor", with: @case.doctor_id
    fill_in "Ended", with: @case.ended
    fill_in "Note", with: @case.note
    fill_in "Owner", with: @case.owner_id
    fill_in "Patient", with: @case.patient_id
    fill_in "Referring doctor", with: @case.referring_doctor_id
    fill_in "Technition", with: @case.technition_id
    click_on "Create Case"

    assert_text "Case was successfully created"
    click_on "Back"
  end

  test "updating a Case" do
    visit cases_url
    click_on "Edit", match: :first

    fill_in "Doctor", with: @case.doctor_id
    fill_in "Ended", with: @case.ended
    fill_in "Note", with: @case.note
    fill_in "Owner", with: @case.owner_id
    fill_in "Patient", with: @case.patient_id
    fill_in "Referring doctor", with: @case.referring_doctor_id
    fill_in "Technition", with: @case.technition_id
    click_on "Update Case"

    assert_text "Case was successfully updated"
    click_on "Back"
  end

  test "destroying a Case" do
    visit cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Case was successfully destroyed"
  end
end
