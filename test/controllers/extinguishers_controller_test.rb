require 'test_helper'

class ExtinguishersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extinguisher = extinguishers(:one)
  end

  test "should get index" do
    get extinguishers_url
    assert_response :success
  end

  test "should get new" do
    get new_extinguisher_url
    assert_response :success
  end

  test "should create extinguisher" do
    assert_difference('Extinguisher.count') do
      post extinguishers_url, params: { extinguisher: { expiration_at: @extinguisher.expiration_at, kind: @extinguisher.kind, sector_id: @extinguisher.sector_id } }
    end

    assert_redirected_to extinguisher_path(Extinguisher.last)
  end

  test "should show extinguisher" do
    get extinguisher_url(@extinguisher)
    assert_response :success
  end

  test "should get edit" do
    get edit_extinguisher_url(@extinguisher)
    assert_response :success
  end

  test "should update extinguisher" do
    patch extinguisher_url(@extinguisher), params: { extinguisher: { expiration_at: @extinguisher.expiration_at, kind: @extinguisher.kind, sector_id: @extinguisher.sector_id } }
    assert_redirected_to extinguisher_path(@extinguisher)
  end

  test "should destroy extinguisher" do
    assert_difference('Extinguisher.count', -1) do
      delete extinguisher_url(@extinguisher)
    end

    assert_redirected_to extinguishers_path
  end
end
