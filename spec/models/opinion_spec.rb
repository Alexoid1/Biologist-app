require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user) { User.create(fullname: 'Rebecca Y', username: 'Rebecayy') }

  before do
    Opinion.create(user_id: user.id, opinion: 'I am the world!')
    Opinion.create(user_id: user.id, opinion: 'Here I am')
  end

  context 'Validations' do
    it { expect(subject).to validate_presence_of(:opinion) }
    it {
      expect(subject).to validate_length_of(:opinion).is_at_most(1000)
        .with_message(/1000 characters in post is the maximum allowed./)
    }
  end

  context 'Associations' do
    it { expect(subject).to belong_to :user }
  end
end
