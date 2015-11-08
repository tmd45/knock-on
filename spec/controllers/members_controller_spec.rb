require 'rails_helper'

RSpec.describe MembersController, type: :controller do

  describe 'GET #index' do
    before do
      create(:member)
      create(:member)
      create(:member)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assign @members all members' do
      get :index
      expect(assigns(:members)).to eq Member.all
    end
  end

end
