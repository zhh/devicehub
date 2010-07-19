class ProjectsController < ApplicationController
  layout 'base'

  def add_project
    @project = Project.new(params[:project])
    if request.post? and @project.save
      flash.now[:notice] = _("project") + " #{@project.name} " + _("Created Success")
      @project = Project.new
#      redirect_to :controller => 'dashboard', :action => 'index'
    end    
  end

  def list
    @projects = Project.find_all_projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def delete_project
    if request.post?
      project = Project.find(params[:id])
      project.destroy
    end
    redirect_to(:action => :list)
  end
end
