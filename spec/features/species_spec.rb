RSpec.feature 'Species', type: :feature do
  login

  scenario 'Create species article' do
    visit('/species/new')
    fill_in 'specie name', with: 'Leiurus quinquestriatus'
    fill_in 'Say something', with: 'look at this little friend that I find in my boots'
    fill_in 'Write the url of the images(http://www.imageexmaple.com)', with: 'https://vignette.wikia.nocookie.net/arachnipedia/images/e/e7/Deathstalker-scorpion-from-the-front-2gxktzj.jpg/revision/latest/scale-to-width-down/340?cb=20130327075633'
    fill_in 'Where this happen', with: 'Pakistan-sijh'
    all('input[type="submit"]').first.click
    visit('/species')
    visit('/species/new')
    fill_in 'specie name', with: 'Vultur gryphus'
    fill_in 'Say something', with: 'The Andes King'
    fill_in 'Write the url of the images(http://www.imageexmaple.com)', with: 'https://vignette.wikia.nocookie.net/colombia/images/0/0b/Vultur-gryphus_gif.jpg/revision/latest/scale-to-width-down/340?cb=20120901014330&path-prefix=es'
    fill_in 'Where this happen', with: 'Cotopaxi - Ecuador'
    all('input[type="submit"]').first.click
    visit('/species')
    expect(page).to have_content 'Leiurus quinquestriatus'
    expect(page).to have_content 'Vultur gryphus'
  end
end
