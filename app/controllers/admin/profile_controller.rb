class Admin::ProfileController < Admin::ApplicationController
  before_action :authenticate
  before_action :current_member

  # GET /admin/profile
  def edit
  end

  # PATCH /admin/profile
  def update
    if @current_member.update(member_params)
      redirect_to admin_profile_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def title
    @title = 'プロフィール編集'
  end
end
