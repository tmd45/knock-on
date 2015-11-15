require 'rails_helper'

RSpec.describe Admin::ProfileController, type: :controller do

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit
      expect(response).to have_http_status(:success)
      expect(assigns(:title)).to eq 'プロフィール編集'
    end
  end

end
