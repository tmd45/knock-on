require 'rails_helper'

RSpec.describe 'Route to Sessions', type: :routing do
  describe 'GET /auth/:provider/callback' do
    it 'routes to #create' do
      expect(get '/auth/google/callback').
        to route_to({
        controller: 'sessions',
        action: 'create',
        provider: 'google',
      })
    end
  end
end
