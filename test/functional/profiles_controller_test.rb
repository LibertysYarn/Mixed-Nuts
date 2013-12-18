require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jason).profile_name
    assert_response :success
    assert_template 'profiles/show'  
  end
    
    test "should render a 404 on profile not found" do
        get :show, id: "doesn't exist"
        assert_response :not_found

end

    test "that vaiables are assigned on successful profile viewing" do
        get :show, id: users(:jason).profile_name
        assert assigns(:user)
        assert_not_empty assign(:statuses)
    end    
    
    test "only shoes the correct usre's status"
        get :show, id: users(:jason).profile_name
        assigns(:statues).each do |status|
            assert_equal users(:jason), status.user
        end
    end