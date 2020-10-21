RSpec.describe Following, type: :model do
  context 'Association' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to belong_to(:follower) }
  end
end
