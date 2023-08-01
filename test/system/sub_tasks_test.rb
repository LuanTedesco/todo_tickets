require "application_system_test_case"

class SubTasksTest < ApplicationSystemTestCase
  setup do
    @sub_task = sub_tasks(:one)
  end

  test "visiting the index" do
    visit sub_tasks_url
    assert_selector "h1", text: "Sub tasks"
  end

  test "should create sub task" do
    visit sub_tasks_url
    click_on "New sub task"

    fill_in "Date end", with: @sub_task.date_end
    fill_in "Name", with: @sub_task.name
    click_on "Create Sub task"

    assert_text "Sub task was successfully created"
    click_on "Back"
  end

  test "should update Sub task" do
    visit sub_task_url(@sub_task)
    click_on "Edit this sub task", match: :first

    fill_in "Date end", with: @sub_task.date_end
    fill_in "Name", with: @sub_task.name
    click_on "Update Sub task"

    assert_text "Sub task was successfully updated"
    click_on "Back"
  end

  test "should destroy Sub task" do
    visit sub_task_url(@sub_task)
    click_on "Destroy this sub task", match: :first

    assert_text "Sub task was successfully destroyed"
  end
end
