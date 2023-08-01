require "application_system_test_case"

class PrioritiesTest < ApplicationSystemTestCase
  setup do
    @priority = priorities(:one)
  end

  test "visiting the index" do
    visit priorities_url
    assert_selector "h1", text: "Priorities"
  end

  test "should create priority" do
    visit priorities_url
    click_on "New priority"

    fill_in "Description", with: @priority.description
    fill_in "Level", with: @priority.level
    fill_in "Status", with: @priority.status
    fill_in "Title", with: @priority.title
    click_on "Create Priority"

    assert_text "Priority was successfully created"
    click_on "Back"
  end

  test "should update Priority" do
    visit priority_url(@priority)
    click_on "Edit this priority", match: :first

    fill_in "Description", with: @priority.description
    fill_in "Level", with: @priority.level
    fill_in "Status", with: @priority.status
    fill_in "Title", with: @priority.title
    click_on "Update Priority"

    assert_text "Priority was successfully updated"
    click_on "Back"
  end

  test "should destroy Priority" do
    visit priority_url(@priority)
    click_on "Destroy this priority", match: :first

    assert_text "Priority was successfully destroyed"
  end
end
