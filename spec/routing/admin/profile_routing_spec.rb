require 'rails_helper'

RSpec.describe 'Route to Profile in Admin', type: :routing do
  describe 'GET /admin/profile' do
    it 'routes to #edit' do
      expect(get '/admin/profile').
        to route_to({
        controller: 'admin/profile',
        action: 'edit',
      })
    end
  end

  describe 'PATCH /admin/profile' do
    it 'routes to #update' do
      expect(patch '/admin/profile').
        to route_to({
        controller: 'admin/profile',
        action: 'update',
      })
    end
  end
end
