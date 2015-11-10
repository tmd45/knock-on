require 'rails_helper'

RSpec.describe 'Route to Members', type: :routing do
  describe 'GET /members' do
    it 'routes to #index' do
      expect(get '/members').
        to route_to({
        controller: 'members',
        action: 'index',
      })
    end
  end
end
