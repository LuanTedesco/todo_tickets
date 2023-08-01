require "test_helper"

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference("Ticket.count") do
      post tickets_url, params: { ticket: { attachment_id: @ticket.attachment_id, automation_hours: @ticket.automation_hours, category_id: @ticket.category_id, column_id: @ticket.column_id, comment_id: @ticket.comment_id, company_id: @ticket.company_id, date_end: @ticket.date_end, departament_id: @ticket.departament_id, description: @ticket.description, execution_hours: @ticket.execution_hours, priority_id: @ticket.priority_id, sub_tasks_id: @ticket.sub_tasks_id, tag_id: @ticket.tag_id, title: @ticket.title } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { attachment_id: @ticket.attachment_id, automation_hours: @ticket.automation_hours, category_id: @ticket.category_id, column_id: @ticket.column_id, comment_id: @ticket.comment_id, company_id: @ticket.company_id, date_end: @ticket.date_end, departament_id: @ticket.departament_id, description: @ticket.description, execution_hours: @ticket.execution_hours, priority_id: @ticket.priority_id, sub_tasks_id: @ticket.sub_tasks_id, tag_id: @ticket.tag_id, title: @ticket.title } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference("Ticket.count", -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
