class Admin::ProfileController < Admin::ApplicationController
  before_action :authenticate
  before_action :current_member

  # GET /admin/profile
  def edit
  end

  # PATCH /admin/profile
  def update
    if @member.update(member_params)
      redirect_to admin_profile_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def title
    @title = 'プロフィール編集'
  end

  def member_params
    params.require(:member).permit(
      :email,
      :group_id,
      :given_name, :family_name,
      :given_name_kana, :family_name_kana,
      :given_name_alphabet, :family_name_alphabet,
      :slack_identifier
    )
  end
end
