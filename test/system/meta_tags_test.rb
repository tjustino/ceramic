# frozen_string_literal: true

require "application_system_test_case"

# Meta Tags Test
class MetaTagsTest < ApplicationSystemTestCase
  setup do
    @meta_tag = meta_tags(:one)
  end

  test "visiting the index" do
    visit meta_tags_url
    assert_selector "h1", text: "Meta Tags"
  end

  test "creating a Meta tag" do
    visit meta_tags_url
    click_on "New Meta Tag"

    fill_in "Name", with: @meta_tag.name
    click_on "Create Meta tag"

    assert_text "Meta tag was successfully created"
    click_on "Back"
  end

  test "updating a Meta tag" do
    visit meta_tags_url
    click_on "Edit", match: :first

    fill_in "Name", with: @meta_tag.name
    click_on "Update Meta tag"

    assert_text "Meta tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Meta tag" do
    visit meta_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meta tag was successfully destroyed"
  end
end
