require 'rails_helper'

RSpec.describe 'Route to Attendees', type: :routing do
  describe 'POST /members/:member_id/attendees' do
    it 'routes to #create' do
      expect(post '/members/321/attendees').
        to route_to({
        controller: 'attendees',
        action: 'create',
        member_id: '321',
      })
    end
  end
end
