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

  describe 'GET #new' do
    subject { get :new }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      it 'returns http success' do
        subject
        expect(response).to have_http_status(:success)
        expect(assigns(:title)).to eq '社員新規登録'
      end
    end
  end

  describe 'POST #create' do
    subject { post :create, { member: {} } }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      let(:request_params) do
        {
          member: {
            email: 'spec@example.com',
            given_name: '太郎', family_name: '山田',
            given_name_kana: 'たろう', family_name_kana: 'やまだ',
            given_name_alphabet: 'Taro', family_name_alphabet: 'Yamada',
            slack_identifier: 'ytaro'
          }
        }
      end

      it 'returns http success' do
        expect do
          post :create, request_params
        end.to change { Member.count }.by(1)
        # NOTE: default_scope よくないな… > reorder(nil)
        expect(response).to redirect_to "/admin/members/#{Member.reorder(nil).last.id}/edit"
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, { id: 1 } }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      context 'has member' do
        before { @member = create(:member) }

        it 'returns http success' do
          get :edit, { id: @member.id }
          expect(response).to have_http_status(:success)
          expect(assigns(:title)).to eq '社員情報編集'
        end
      end
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, { id: 1, member: {} } }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      context 'has member' do
        before { @member = create(:member) }

        let(:request_params) do
          {
            id: @member.id,
            member: {
              email: 'spec@example.com',
              given_name: '太郎', family_name: '山田',
              given_name_kana: 'たろう', family_name_kana: 'やまだ',
              given_name_alphabet: 'Taro', family_name_alphabet: 'Yamada',
              slack_identifier: 'ytaro'
            }
          }
        end

        it 'returns http success' do
          expect do
            patch :update, request_params
          end.to change { Member.find(@member.id).updated_at }
          expect(response).to redirect_to '/admin/members'
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, { id: 1 } }
    it_behaves_like 'Rejecting unknown member'

    context 'has logged-in' do
      include_context 'member logged-in'

      context 'has member' do
        before { @member = create(:member) }

        it 'destroys' do
          expect do
            delete :destroy, { id: @member.id }
          end.to change { Member.count }.by(-1)
          expect(response).to redirect_to '/admin/members'
        end
      end
    end
  end

end
