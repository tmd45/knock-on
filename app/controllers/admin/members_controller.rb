class Admin::MembersController < Admin::ApplicationController
  before_action :authenticate
  before_action :current_member
  before_action :set_member, only: [ :edit, :update, :destroy ]

  # GET /admin/members
  def index
    @title = '登録社員一覧'
    @members = Member.all.reorder(:id)
  end

  # GET /admin/members/:id/edit
  def edit
    @title = '社員情報編集'
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end
end
