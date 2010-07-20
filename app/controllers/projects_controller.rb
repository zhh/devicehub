class ProjectsController < ApplicationController
  layout 'base'

  def index
    @projects = Project.find_all_projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new(params[:project])
    if request.post? and @project.save
      flash.now[:notice] = _("project") + " #{@project.name} " + _("Created Success")
      @project = Project.new
#      redirect_to :controller => 'dashboard', :action => 'index'
    end    
  end

  def edit
    @project = Project.find(params[:id])
    if request.post? and @project.update_attributes(params[:project])
      flash[:notice] = _("Update Success")
      redirect_to :action => 'show', :id => @project
    end
  end

  def destroy
    if request.post?
      project = Project.find(params[:id])
      project.destroy
    end
    redirect_to :action => :index
  end
end
