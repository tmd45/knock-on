require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'validation' do
    describe '#provider' do
      it { should validate_presence_of(:provider) }
    end

    describe '#uid' do
      it { should validate_presence_of(:uid) }
      it 'should require unique value for uid scoped to provider' do
        create(:member, provider: 'google', uid: '10000567890')
        expect(build(:member, provider: 'google',  uid: '10000567890')).to be_invalid
        expect(build(:member, provider: 'example', uid: '10000567890')).to be_valid
        expect(build(:member, provider: 'google',  uid: '10000567891')).to be_valid
      end
    end

    describe '#email' do
      it { should validate_presence_of(:email) }
      it 'should require unique value for email' do
        create(:member, uid: '10000567890', email: 'a@a')
        expect(build(:member, uid: '10000567891', email: 'a@a')).to be_invalid
        expect(build(:member, uid: '10000567892', email: 'b@b')).to be_valid
      end
    end
  end

  describe '.find_or_create_from_auth_hash' do
    let(:auth_hash) do
      {
        provider: 'google', uid: '1000067890',
        info: { email: 'hanako@example.com' }
      }
    end

    context 'has no member' do
      it 'return create member' do
        member = nil
        expect {
          member = Member.find_or_create_from_auth_hash(auth_hash)
        }.to change{ Member.count }.from(0).to(1)
        expect(member).to be_persisted
        expect(member.provider).to eq 'google'
        expect(member.uid).to eq '1000067890'
      end
    end

    context 'has member already' do
      before { @member = create(:member, provider: 'google', uid: '1000067890') }

      it 'return find member' do
        member = nil
        expect {
          member = Member.find_or_create_from_auth_hash(auth_hash)
        }.to_not change{ Member.count }
        expect(member).to be_persisted
        expect(member.id).to eq @member.id
        expect(member.provider).to eq 'google'
        expect(member.uid).to eq '1000067890'
      end
    end
  end
end
