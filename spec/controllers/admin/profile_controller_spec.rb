require 'rails_helper'

RSpec.describe Admin::ProfileController, type: :controller do

  describe 'GET #edit' do
    context 'has not log-in' do
      it 'redirect to root' do
        get :edit
        expect(response).to redirect_to(root_path)
      end
    end

    context 'has logged-in' do
      before do
        member = create :member
        session[:member_id] = member.id
        get :edit
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
        expect(assigns(:title)).to eq 'プロフィール編集'
      end
    end
  end

end
