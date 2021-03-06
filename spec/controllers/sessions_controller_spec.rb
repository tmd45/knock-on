require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'create' do
    before do
      auth_hash_google = File.read(File.join(Rails.root, 'spec', 'data', 'auth_hash_google.rb'))
      request.env['omniauth.auth'] = OmniAuth::AuthHash.new(eval auth_hash_google)
    end

    subject { get :create, { provider: 'google' } }

    it 'redirect to admin path' do
      expect(subject).to redirect_to '/admin'
    end

    it 'save member_id to session' do
      subject
      expect(session[:member_id]).to eq Member.last.id
    end
  end

  describe 'destroy' do
    before do
      session[:member_id] = '12345'
    end

    subject { get :destroy }

    it 'redirect to root path' do
      expect(subject).to redirect_to root_path
    end

    it 'reset session' do
      subject
      expect(session[:member_id]).to be_nil
    end
  end
end
