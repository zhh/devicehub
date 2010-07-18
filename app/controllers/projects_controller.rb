class ProjectsController < ApplicationController
  layout 'app'
  def add_project
    @project = Project.new(params[:project])
    if request.post? and @project.save
      flash.now[:notice] = _("project") + " #{@project.name} " + _("Created Success")
      @project = Project.new
#      redirect_to :controller => 'dashboard', :action => 'index'
    end
  end

  def list
    
  end
end
