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

    context 'has logged-in unknown member' do
      before do
        session[:member_id] = 999
        get :edit
      end

      it 'redirect to root and clear session' do
        expect(response).to redirect_to(root_path)
        expect(session[:member_id]).to be_nil
      end
    end
  end

end
