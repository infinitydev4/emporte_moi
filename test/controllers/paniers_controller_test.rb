require 'test_helper'

class PaniersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @panier = paniers(:one)
  end

  test "should get index" do
    get paniers_url
    assert_response :success
  end

  test "should get new" do
    get new_panier_url
    assert_response :success
  end

  test "should create panier" do
    assert_difference('Panier.count') do
      post paniers_url, params: { panier: { quantité: @panier.quantité } }
    end

    assert_redirected_to panier_url(Panier.last)
  end

  test "should show panier" do
    get panier_url(@panier)
    assert_response :success
  end

  test "should get edit" do
    get edit_panier_url(@panier)
    assert_response :success
  end

  test "should update panier" do
    patch panier_url(@panier), params: { panier: { quantité: @panier.quantité } }
    assert_redirected_to panier_url(@panier)
  end

  test "should destroy panier" do
    assert_difference('Panier.count', -1) do
      delete panier_url(@panier)
    end

    assert_redirected_to paniers_url
  end
end
