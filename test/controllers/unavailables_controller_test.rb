require 'test_helper'

class UnavailablesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get unavailables_create_url
    assert_response :success
  end

end
