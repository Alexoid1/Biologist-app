require 'test_helper'

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @species = species(:one)
  end

  test 'should get index' do
    get species_url
    assert_response :success
  end

  test 'should get new' do
    get new_species_url
    assert_response :success
  end

  test 'should create species' do
    assert_difference('Specie.count') do
      post species_url, params: { species: { content: @species.content, date: @species.date, image: @species.image, location: @species.location, specie: @species.specie } }
    end

    assert_redirected_to species_url(Specie.last)
  end

  test 'should show species' do
    get species_url(@species)
    assert_response :success
  end

  test 'should get edit' do
    get edit_species_url(@species)
    assert_response :success
  end

  test 'should update species' do
    patch species_url(@species), params: { species: { content: @species.content, date: @species.date, image: @species.image, location: @species.location, specie: @species.specie } }
    assert_redirected_to species_url(@species)
  end

  test 'should destroy species' do
    assert_difference('Specie.count', -1) do
      delete species_url(@species)
    end

    assert_redirected_to species_url
  end
end
