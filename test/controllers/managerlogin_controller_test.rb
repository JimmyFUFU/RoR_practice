require 'test_helper'

class ManagerloginControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get managerlogin_new_url
    assert_response :success
  end

  test "should get create" do
    get managerlogin_create_url
    assert_response :success
  end

  test "should get destory" do
    get managerlogin_destory_url
    assert_response :success
  end

end
