RSpec.configure do |config|
  config.before(type: :feature) do
    @user = User.create(id: 54, fullname: 'Alexoid Z',
                        username: 'Alexoid2',
                        photo: 'https://st-listas.20minutos.es/images/2015-03/394807/4670012_640px.jpg?1426200296',
                        coverimage: 'https://images2.alphacoders.com/100/thumb-1920-1000774.jpg')
    @user2 = User.create(id: 55, fullname: 'Lencha B',
                         username: 'Lencha Bast',
                         photo: 'https://pbs.twimg.com/profile_images/1227705353388736512/40ieHc7f_400x400.jpg',
                         coverimage: 'https://sm.ign.com/t/ign_latam/screenshot/default/evamun_ut7k.1280.jpg')
    @user3 = User.create(id: 56, fullname: 'Lily Y',
                         username: 'Niceflower',
                         photo: 'https://latin-brides.com/images/reviews/latinamericacupid-1553786747777.jpg',
                         coverimage: 'https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&w=1600&h=838&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2020%2F03%2Fcarlsbad-flower-fields-california-worker-FLOWERFIELDSCA0220.jpg')
    @user4 = User.create(id: 57,
                         fullname: 'Jilly M',
                         username: 'Eviltiny',
                         photo: 'https://www.hola.com/imagenes/belleza/tendencias/2017092099476/cortes-de-pelo-estilo-middleton/0-488-558/elsa_hosk_m-m.jpg',
                         coverimage: 'https://www.ctvnews.ca/polopoly_fs/1.5063738.1597360423!/httpImage/image.jpg_gen/derivatives/landscape_1020/image.jpg')

    @user.followers.build(followedid: @user2.id).save
    @user3.followers.build(followedid: @user4.id).save

    Opinion.create(user_id: @user.id, opinion: 'I am the world! yeahhh')
    Opinion.create(user_id: @user.id, opinion: 'I am the world! 2')
  end

  def login()
    before do
      visit new_session_path
      fill_in 'username here', with: @user.username

      click_on 'Sign in'
    end
  end
end
