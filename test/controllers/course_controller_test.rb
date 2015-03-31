require 'test_helper'

class CourseControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

end
