class ProjectsController < ApplicationController
  layout 'base'

  before_filter :projectlist

  def index
    @nav = "projects"
    @action = "project_new"
    @projects = Project.find_all_projects(params[:order])
  end

  def overview
    @nav = "projects_overview"
    @action = "projects_overview"
    @projects = Project.find_all_projects('created_at desc')
    @project = Project.find(params[:id])
  end

  def new
    @nav = "projects"
    @action = "project_new"
    @project = Project.new(params[:project])
    @project.user_id = 2
    if request.post? and @project.save
      flash[:notice] = _("project") + " #{@project.name} " + _("Created Success")
      redirect_to :action => 'overview', :id => @project
    end    
  end

  def edit
    @nav = "projects_overview"
    @action = "project_destroy"
    @project = Project.find(params[:id])
    @destroy_obj = @project
    if request.post? and @project.update_attributes(params[:project])
      flash[:notice] = _("Update Success")
      redirect_to :action => 'overview', :id => @project
    end
  end

  def destroy
    if request.post?
      project = Project.find(params[:id])
      begin
        project.destroy
        flash[:notice] = _("project") + " #{project.name} " + _("Destroy Success")
        redirect_to :controller => :projects, :action => :index
      rescue Exception => e
        flash[:errors] = e.message
        redirect_to :controller => :projects, :action => :overview, :id => project
        #      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
      end
    end    
  end
end