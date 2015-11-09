class AttendeesController < ApplicationController

  # POST /members/:member_id/attendees
  # POST /attendees
  #
  # @note
  #   フォームの remote: true でリクエストされる想定なので
  #   失敗時にはエラーメッセージを json で返す
  def create
    if params[:member_id]
      member = Member.find(params[:member_id])
    end

    notifier = Slack::Notifier.new Settings.slack.incoming_webhook_url
    mention =
      if member && member.slack_identifier
        "<@#{member.slack_identifier}>"
      else
        "<!here>"
      end
    message = "#{mention} 受付にお客様がお見えです。"
    res = notifier.ping message

    if res.code_type == Net::HTTPOK
      flash[:notice] = 'ただいまお呼び出ししています。'
      head 201
    else
      render json: { messages: 'failed' }, status: 503
    end
  end

end
