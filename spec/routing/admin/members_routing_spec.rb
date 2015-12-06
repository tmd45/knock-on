require 'rails_helper'

RSpec.describe 'Route to Members in Admin', type: :routing do
  describe 'GET /admin/members' do
    it 'routes to #index' do
      expect(get '/admin/members').
        to route_to({
        controller: 'admin/members',
        action: 'index',
      })
    end
  end

  describe 'GET /admin/members/new' do
    it 'routes to #new' do
      expect(get '/admin/members/new').
        to route_to({
        controller: 'admin/members',
        action: 'new',
      })
    end
  end

  describe 'POST /admin/members' do
    it 'routes to #create' do
      expect(post '/admin/members').
        to route_to({
        controller: 'admin/members',
        action: 'create',
      })
    end
  end

  describe 'GET /admin/members/:id/edit' do
    it 'routes to #edit' do
      expect(get '/admin/members/1/edit').
        to route_to({
        controller: 'admin/members',
        action: 'edit',
        id: '1',
      })
    end
  end

  describe 'PUT /admin/members/:id' do
    it 'routes to #update' do
      expect(put '/admin/members/1').
        to route_to({
        controller: 'admin/members',
        action: 'update',
        id: '1',
      })
    end
  end

  describe 'DELETE /admin/members/:id' do
    it 'routes to #destroy' do
      expect(delete '/admin/members/1').
        to route_to({
        controller: 'admin/members',
        action: 'destroy',
        id: '1',
      })
    end
  end
end
