require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_index_url
    assert_response :success
  end

  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get incontext" do
    get tasks_incontext_url
    assert_response :success
  end

  test "should get step" do
    get tasks_step_url
    assert_response :success
  end

end
