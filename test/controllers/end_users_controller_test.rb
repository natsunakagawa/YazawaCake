require 'test_helper'

class EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get yours" do
    get end_users_yours_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_edit_url
    assert_response :success
  end

  test "should get leave" do
    get end_users_leave_url
    assert_response :success
  end

end
