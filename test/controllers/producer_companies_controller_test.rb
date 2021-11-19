require "test_helper"

class ProducerCompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producer_companies_index_url
    assert_response :success
  end

  test "should get show" do
    get producer_companies_show_url
    assert_response :success
  end
end
