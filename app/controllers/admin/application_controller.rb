require 'application_controller'

class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :title

  private

  def title
    @title = '管理ページ'
  end
end
