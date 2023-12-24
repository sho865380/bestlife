require 'test_helper'

class PhysicalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get physicals_new_url
    assert_response :success
  end

  test "should get create" do
    get physicals_create_url
    assert_response :success
  end

end
