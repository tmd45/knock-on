class Admin::MembersController < Admin::ApplicationController
  before_action :authenticate
  before_action :current_member

  # GET /admin/members
  #
  def index
  end

  private

  def title
    @title = '登録社員一覧'
  end
end
