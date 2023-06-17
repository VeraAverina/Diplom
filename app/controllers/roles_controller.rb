class RolesController < ApplicationController
  def index
    @roles=Role.all
  end
  def show
    @role=Role.find(params[:id])
  #  @result = Result.new(:user_id => current_user.id, :role_id => @role.id)
  end

end
