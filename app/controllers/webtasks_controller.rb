class WebtasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @webtasks=Webtask.all
  end
  def show
    @webtask=Webtask.find(params[:id])
  end
end
