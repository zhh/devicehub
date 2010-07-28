class AreasController < ApplicationController
  layout 'base'
  
  before_filter :projectlist

  def overview
    @project = Project.find(params[:id])
    @areas = Area.find_all_project_areas(@project)
  end

  def new
    @project = Project.find(params[:id])
    area = Area.new(params[:area])
    area.user_id = 1
    if request.post? and @project.areas << area
      flash[:notice] = _("area") + " #{area.name} " + _("Created Success")
      redirect_to :action => 'overview', :id => @project
    end
  end

  def edit
    @area = Area.find(params[:id])
    @project = @area.project
    if request.post? and @area.update_attributes(params[:area])
      flash[:notice] = _("Update Success")
      redirect_to :action => 'overview', :id => @project
    end
  end

  def destroy
    if request.post?
      area = Area.find(params[:id])
      begin
        area.destroy
        flash[:notice] = _("area") + " #{area.name} " + _("Destroy Success")
      rescue Exception => e
        flash[:notice] = e.message
      end      
      #      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
    end
    redirect_to :action => :overview, :id => area.project
  end
end
