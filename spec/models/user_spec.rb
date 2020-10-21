require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_2) { User.create(username: 'Rebecca Y', fullname: 'recca@opal.com') }
  let(:user_3) { User.create(username: 'Rebecca ryrty', fullname: 'reccafghjfgopal.com') }
  subject { User.create(username: 'Abd A', fullname: 'a.aziz@opal.com') }

  before do
    Following.create(follower_id: subject.id, followed_id: user_2.id)
  end

  context 'Validations' do
    it { expect(subject).to validate_presence_of(:username) }
    it { expect(subject).to validate_presence_of(:fullname) }

    it { expect(subject).to allow_value('a.aziz@opal.com').for(:fullname) }
    it { expect(subject).to_not allow_value('').for(:username) }
  end

  context 'Associations' do
    it { expect(subject).to have_many(:opinions) }
    it { expect(subject).to have_many(:followers) }
    it { expect(subject).to have_many(:follows) }
    it { expect(subject).to have_many(:species) }
  end
end
