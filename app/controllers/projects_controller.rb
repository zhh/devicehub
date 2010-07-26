class ProjectsController < ApplicationController
  layout 'base'

  before_filter :projectlist

  def index    
    @projects = Project.find_all_projects(params[:order])
  end

  def overview
    @projects = Project.find_all_projects('created_at desc')
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new(params[:project])
    @project.user_id = 2
    if request.post? and @project.save
      flash[:notice] = _("project") + " #{@project.name} " + _("Created Success")
#      @project = Project.new
      redirect_to :action => 'overview', :id => @project
    end    
  end

  def edit
    @project = Project.find(params[:id])
    if request.post? and @project.update_attributes(params[:project])
      flash[:notice] = _("Update Success")
      redirect_to :action => 'overview', :id => @project
    end
  end

  def destroy
    if request.post?
      project = Project.find(params[:id])
      project.destroy
      flash[:notice] = _("project") + " #{project.name} " + _("Destroy Success")
#      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
    end
    redirect_to :controller => :dashboard, :action => :index
  end
end