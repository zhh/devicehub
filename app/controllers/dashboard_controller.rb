class DashboardController < ApplicationController
  layout 'base'
  
  def index
    projectlist
    @nav = "dashboard"
  end

end
