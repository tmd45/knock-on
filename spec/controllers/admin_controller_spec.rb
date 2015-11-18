require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe 'GET #index' do
    context 'has not log-in' do
      it 'redirect to root' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    context 'has logged-in' do
      before do
        member = create :member
        session[:member_id] = member.id
        get :index
      end

      it 'redirect to /admin/profile' do
        expect(response).to redirect_to('/admin/profile')
      end
    end
  end

end
