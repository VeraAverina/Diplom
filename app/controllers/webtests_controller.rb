class WebtestsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @webtests=Webtest.all
  end

  def show
    @webtest=Webtest.find(params[:id])
  end
end
