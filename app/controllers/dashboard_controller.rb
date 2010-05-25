class DashboardController < ApplicationController
  layout 'base'
  def index
    @projects = Project.find_all_projects
  end

end
