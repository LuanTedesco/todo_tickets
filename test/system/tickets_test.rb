require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "should create ticket" do
    visit tickets_url
    click_on "New ticket"

    fill_in "Attachment", with: @ticket.attachment_id
    fill_in "Automation hours", with: @ticket.automation_hours
    fill_in "Category", with: @ticket.category_id
    fill_in "Column", with: @ticket.column_id
    fill_in "Comment", with: @ticket.comment_id
    fill_in "Company", with: @ticket.company_id
    fill_in "Date end", with: @ticket.date_end
    fill_in "Departament", with: @ticket.departament_id
    fill_in "Description", with: @ticket.description
    fill_in "Execution hours", with: @ticket.execution_hours
    fill_in "Priority", with: @ticket.priority_id
    fill_in "Sub tasks", with: @ticket.sub_tasks_id
    fill_in "Tag", with: @ticket.tag_id
    fill_in "Title", with: @ticket.title
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "should update Ticket" do
    visit ticket_url(@ticket)
    click_on "Edit this ticket", match: :first

    fill_in "Attachment", with: @ticket.attachment_id
    fill_in "Automation hours", with: @ticket.automation_hours
    fill_in "Category", with: @ticket.category_id
    fill_in "Column", with: @ticket.column_id
    fill_in "Comment", with: @ticket.comment_id
    fill_in "Company", with: @ticket.company_id
    fill_in "Date end", with: @ticket.date_end
    fill_in "Departament", with: @ticket.departament_id
    fill_in "Description", with: @ticket.description
    fill_in "Execution hours", with: @ticket.execution_hours
    fill_in "Priority", with: @ticket.priority_id
    fill_in "Sub tasks", with: @ticket.sub_tasks_id
    fill_in "Tag", with: @ticket.tag_id
    fill_in "Title", with: @ticket.title
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "should destroy Ticket" do
    visit ticket_url(@ticket)
    click_on "Destroy this ticket", match: :first

    assert_text "Ticket was successfully destroyed"
  end
end
