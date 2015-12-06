require 'rails_helper'

RSpec.describe Admin::MembersController, type: :controller do

  shared_context 'member logged-in' do
    before do
      member = create :member
      session[:member_id] = member.id
    end
  end

  shared_examples_for 'Rejecting unknown member' do
    context 'has not log-in' do
      it 'redirect to root' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    context 'has logged-in unknown member' do
      it 'redirect to root and clear session' do
        session[:member_id] = 999
        subject
        expect(response).to redirect_to(root_path)
        expect(session[:member_id]).to be_nil
      end
    end
  end

  describe 'GET #index' do
    subject { get :index }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
        expect(assigns(:title)).to eq '登録社員一覧'
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, { id: 1 } }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
        expect(assigns(:title)).to eq '社員情報編集'
      end
    end
  end

end
