require "application_system_test_case"

class PaniersTest < ApplicationSystemTestCase
  setup do
    @panier = paniers(:one)
  end

  test "visiting the index" do
    visit paniers_url
    assert_selector "h1", text: "Paniers"
  end

  test "creating a Panier" do
    visit paniers_url
    click_on "New Panier"

    fill_in "Quantité", with: @panier.quantité
    click_on "Create Panier"

    assert_text "Panier was successfully created"
    click_on "Back"
  end

  test "updating a Panier" do
    visit paniers_url
    click_on "Edit", match: :first

    fill_in "Quantité", with: @panier.quantité
    click_on "Update Panier"

    assert_text "Panier was successfully updated"
    click_on "Back"
  end

  test "destroying a Panier" do
    visit paniers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Panier was successfully destroyed"
  end
end
