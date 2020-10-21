require 'rails_helper'

RSpec.describe Species, type: :model do
  let(:user) { User.create(fullname: 'Rebecca Y', username: 'Rebecayy') }

  before do
    Species.create(user_id: user.id,
                   specie: 'Leiurus quinquestriatus',
                   content: 'look at this little friend that I find in my boots',
                   image: 'https://vignette.wikia.nocookie.net/arachnipedia/images/e/e7/Deathstalker-scorpion-from-the-front-2gxktzj.jpg/revision/latest/scale-to-width-down/340?cb=20130327075633',
                   location: 'Pakistan-sijh',
                   date: Time.now)
  end

  context 'Validations' do
    it { expect(subject).to validate_presence_of(:specie) }
    it { expect(subject).to validate_presence_of(:content) }
    it { expect(subject).to validate_presence_of(:location) }
    it { expect(subject).to validate_presence_of(:image) }
  end

  context 'Associations' do
    it { expect(subject).to belong_to :user }
  end
end
