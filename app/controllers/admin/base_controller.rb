class Admin::BaseController < ApplicationController
  before_action :require_admin

  def index; end

  private

  def require_admin
    render file: '/public/404' if current_user && !current_user.admin?
  end
end
