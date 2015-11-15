class SessionsController < ApplicationController

  # GET /auth/:callback/callback
  #
  def create
    member = Member.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:member_id] = member.id
    redirect_to admin_path, notice: t('omniauth.sessions.logged_in')
  end

  # GET /logout
  #
  def destroy
    reset_session
    redirect_to root_path, notice: t('omniauth.sessions.logged_out')
  end

end
