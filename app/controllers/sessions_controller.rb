class SessionsController < ApplicationController
  def create
    member = Member.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:member_id] = member.id
    redirect_to root_path, notice: t('omniauth.sessions.signed_in')
  end
end
