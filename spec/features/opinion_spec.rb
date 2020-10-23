require 'rails_helper'

RSpec.feature 'Opinions', type: :feature do
  login

  scenario 'Writing a opinion' do
    visit opinions_path
    fill_in 'Write here', with: 'Yes I am'
    click_on 'Save'
    expect(page).to have_content 'Opinion was successfully created.'
    expect(page).to have_content 'Yes I am'
  end

  scenario 'Writing another opinion' do
    visit opinions_path
    fill_in 'Write here', with: 'Me again'
    click_on 'Save'
    expect(page).to have_content 'Opinion was successfully created.'
    expect(page).to have_content 'Me again'
  end

  scenario 'Check opinion stats in profile' do
    visit('/users/54')
    expect(page).to have_content '2'
  end
end
