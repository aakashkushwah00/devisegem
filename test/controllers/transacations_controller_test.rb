require "test_helper"

class TransacationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transacations_index_url
    assert_response :success
  end
end
