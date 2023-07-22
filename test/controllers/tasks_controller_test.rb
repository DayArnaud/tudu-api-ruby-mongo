require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url, as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { category: @task.category, description: @task.description, expire_date: @task.expire_date, parent_id: @task.parent_id, status: @task.status, title: @task.title, user_id: @task.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show task" do
    get task_url(@task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { category: @task.category, description: @task.description, expire_date: @task.expire_date, parent_id: @task.parent_id, status: @task.status, title: @task.title, user_id: @task.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task), as: :json
    end

    assert_response :no_content
  end
end
