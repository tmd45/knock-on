require 'rails_helper'

RSpec.describe AttendeesController, type: :controller do

  describe 'GET #create' do
    before do
      allow(Settings.slack).to receive(:incoming_webhook_url).
        and_return('https://www.example.com/incoming_webhook_url')
    end

    context 'has member_id and the member has slack_identifier' do
      let(:member) { create(:member, slack_identifier: 'taro') }

      it 'notificate @mention to slack and returns http success' do
        WebMock.stub_request(:post, 'https://www.example.com/incoming_webhook_url').with(
          body: {
            payload: "{\"text\":\"\\u003c@taro\\u003e 受付にお客様がお見えです。\"}"
          }
        ).to_return(status: 200)

        get :create, { member_id: member.id }
        expect(response).to redirect_to root_path
      end
    end

    context 'has member_id and the member has not slack_identifier' do
      let(:member) { create(:member) }

      it 'notificate @here mention and returns http success' do
        WebMock.stub_request(:post, 'https://www.example.com/incoming_webhook_url').with(
          body: {
            payload: "{\"text\":\"\\u003c!here\\u003e 受付にお客様がお見えです。\"}"
          }
        ).to_return(status: 200)

        get :create, { member_id: member.id }
        expect(response).to redirect_to root_path
      end
    end

    context 'has not member_id' do
      it 'notificate @here mention and returns http success' do
        WebMock.stub_request(:post, 'https://www.example.com/incoming_webhook_url').with(
          body: {
            payload: "{\"text\":\"\\u003c!here\\u003e 受付にお客様がお見えです。\"}"
          }
        ).to_return(status: 200)

        get :create
        expect(response).to redirect_to root_path
      end
    end

    context 'notificate failed' do
      it 'returns Service Unavailable and respond json messages' do
        WebMock.stub_request(:post, 'https://www.example.com/incoming_webhook_url').
          to_return(status: 400)

        get :create
        expect(response).to redirect_to '/members'
      end
    end
  end

end
