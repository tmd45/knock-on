require 'application_controller'

class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :title

  private

  def title
    @title = '管理ページ'
  end

  def member_params
    params.require(:member).permit(
      :email,
      :given_name, :family_name,
      :given_name_kana, :family_name_kana,
      :given_name_alphabet, :family_name_alphabet,
      :slack_identifier,
      :group_id, :title, :title_alphabet,
    )
  end
end
