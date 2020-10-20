require "application_system_test_case"

class SpeciesTest < ApplicationSystemTestCase
  setup do
    @species = species(:one)
  end

  test "visiting the index" do
    visit species_url
    assert_selector "h1", text: "Species"
  end

  test "creating a Specie" do
    visit species_url
    click_on "New Specie"

    fill_in "Content", with: @species.content
    fill_in "Date", with: @species.date
    fill_in "Image", with: @species.image
    fill_in "Location", with: @species.location
    fill_in "Specie", with: @species.specie
    click_on "Create Specie"

    assert_text "Specie was successfully created"
    click_on "Back"
  end

  test "updating a Specie" do
    visit species_url
    click_on "Edit", match: :first

    fill_in "Content", with: @species.content
    fill_in "Date", with: @species.date
    fill_in "Image", with: @species.image
    fill_in "Location", with: @species.location
    fill_in "Specie", with: @species.specie
    click_on "Update Specie"

    assert_text "Specie was successfully updated"
    click_on "Back"
  end

  test "destroying a Specie" do
    visit species_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Specie was successfully destroyed"
  end
end
