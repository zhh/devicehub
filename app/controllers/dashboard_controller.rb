class DashboardController < ApplicationController
  layout 'app'
  def index
    @projects = Project.find_projects
  end

end
