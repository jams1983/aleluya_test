require 'test_helper'

class DataArraysControllerTest < ActionDispatch::IntegrationTest
  test "should create data_array" do
    assert_difference 'data_arrays.count', 0 do
      post api_data_arrays_url, params: { data_array: { amount: 10 } }, as: :json
    end

    assert_response 200
  end

  test "should show a data_array info" do
    data_array = DataArray.create(amount: 15)
    get api_data_array_url(data_array), as: :json
    body_response = JSON.parse @response.body

    assert_equal data_array.id, body_response['id']
  end
end
