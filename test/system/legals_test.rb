require "application_system_test_case"

class LegalsTest < ApplicationSystemTestCase
  setup do
    @legal = legals(:one)
  end

  test "visiting the index" do
    visit legals_url
    assert_selector "h1", text: "Legals"
  end

  test "creating a Legal" do
    visit legals_url
    click_on "New Legal"

    fill_in "Title", with: @legal.title
    click_on "Create Legal"

    assert_text "Legal was successfully created"
    click_on "Back"
  end

  test "updating a Legal" do
    visit legals_url
    click_on "Edit", match: :first

    fill_in "Title", with: @legal.title
    click_on "Update Legal"

    assert_text "Legal was successfully updated"
    click_on "Back"
  end

  test "destroying a Legal" do
    visit legals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Legal was successfully destroyed"
  end
end
