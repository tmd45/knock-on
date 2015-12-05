class AttendeesController < ApplicationController

  # POST /members/:member_id/attendees
  # POST /attendees
  #
  # @example parameters
  #   - type: 呼び出し種別（deliver, collect, 未指定）
  # @note
  #   フォームの `remote: true` でリクエストされる想定なので
  #   失敗時にはエラーメッセージを json で返す
  def create
    if params[:member_id]
      member = Member.find(params[:member_id])
    end

    # TODO 呼び出し履歴を作りたい。その場合は Attendee モデルを作る
    # TODO 呼び出し処理自体はいずれ AttendService クラスに持ってく
    notifier = Slack::Notifier.new Settings.slack.incoming_webhook_url
    mention =
      if member
        name = "#{member.family_name} #{member.given_name}".strip.presence || member.email
        if member.slack_identifier
          "<@#{member.slack_identifier}> *#{name}* さん"
        else
          "<!here> *#{name}* さん"
        end
      else
        "<!here>"
      end

    message =
      case params[:type].presence
      when 'deliver'
        "#{mention} 受付に *荷物の配達* が来ています。対応をお願いします。"
      when 'collect'
        "#{mention} 受付に *荷物の集荷* が来ています。対応をお願いします。"
      when 'general'
        "#{mention} 総合受付にお客様がお見えです。"
      else
        "#{mention} 受付にお客様がお見えです。"
      end

    res = notifier.ping message

    if res.code_type == Net::HTTPOK
      render :new
    else
      redirect_to members_path, alert: 'お呼び出しに失敗しました。'
    end
  end

end
