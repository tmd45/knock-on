class Admin::MembersController < Admin::ApplicationController
  before_action :authenticate
  before_action :current_member
  before_action :set_member, only: [ :edit, :update, :destroy ]

  # GET /admin/members
  def index
    @title = '登録社員一覧'
    @members = Member.all.reorder(:id)
  end

  # GET /admin/members/new
  def new
    @title = '社員新規登録'
    @member = Member.new
  end

  # GET /admin/members/:id/edit
  def edit
    @title = '社員情報編集'
  end

  # PATCH /admin/profile
  def update
    if @member.update(member_params)
      redirect_to admin_members_path, notice: '更新しました'
    else
      render :edit
    end
  end

  # DELETE /admin/members/:id
  def destroy
    if @member.destroy
      redirect_to admin_members_path, notice: '削除しました'
    else
      redirect_to admin_members_path, alert: '削除に失敗しました'
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end
end
