require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validation' do
    describe '#name' do
      it { should validate_presence_of(:name) }
    end
  end
end
