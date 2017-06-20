# == Schema Information
#
# Table name: addresses
#
#  id        :integer          not null, primary key
#  name      :string
#  latitude  :float
#  longitude :float
#  elevation :float
#

require 'test_helper'
require 'net/http'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @BASE_URI = "http://localhost:3000/api/addresses/"
  end
  

  test 'POST address' do
    uri = URI(@BASE_URI)
    res = Net::HTTP.post_form(uri, string: 'alguna calle')
    res_obj = JSON.parse(res.body)
    assert_equal(res_obj["status"],"OK")
    valid_id = res_obj["address"]["id"].to_i > 0
    assert_equal(valid_id,true)
  end

  test 'GET all addresses' do
    uri = URI(@BASE_URI)
    res = Net::HTTP.get_response(uri)
    res_obj = JSON.parse(res.body)
    assert_equal(res_obj["status"],"OK")
    valid_count = res_obj["addresses"].count > 0
    assert_equal(valid_count,true)
  end

  test 'GET address by valid id' do
    uri = URI(@BASE_URI+"6")
    res = Net::HTTP.get_response(uri)
    res_obj = JSON.parse(res.body)
    assert_equal(res_obj["status"],"OK")
    valid_latitude = res_obj["address"]["latitude"].to_i != 0
    valid_longitude = res_obj["address"]["longitude"].to_i != 0
    valid_elevation = res_obj["address"]["elevation"].to_i != 0
    assert_equal(valid_latitude,true)
    assert_equal(valid_longitude,true)
    assert_equal(valid_elevation,true)
  end

  test 'GET address by invalid id' do
    uri = URI(@BASE_URI)
    res = Net::HTTP.get_response(uri+"-1")
    res_obj = JSON.parse(res.body)
    assert_equal(res_obj["status"],"INVALID_REQUEST")
  end


end
