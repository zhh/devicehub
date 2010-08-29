class AreasController < ApplicationController
  layout 'base'
  
  before_filter :projectlist

  def overview
    @nav = "areas_overview"
    @action = "area_new"
    @project = Project.find(params[:id])
    @areas = Area.find_all_project_areas(@project)    
  end

  def new
    @nav = "areas_overview"
    @action = "area_new"
    @project = Project.find(params[:id])    
    @area = Area.new(params[:area])
    @area.user_id = 1
    if request.post? and @project.areas << @area
      flash[:notice] = _("area") + " #{@area.name} " + _("Created Success")
      redirect_to :action => :overview, :id => @project
    end
  end

  def edit
    @nav = "areas_overview"
    @action = "area_destroy_move"
    @area = Area.find(params[:id])
    @project = @area.project
    @destroy_obj = @area
    if request.post?
      begin
        @area.update_attributes(params[:area])
        flash[:notice] = _("Update Success")
        redirect_to :action => 'overview', :id => @project
      rescue Exception => e
        flash[:errors] = e.message
      end
    end
  end

  def move
    edit
  end

  def destroy
    area = Area.find(params[:id])
    if request.post?      
      begin
        area.destroy
        flash[:notice] = _("area") + " #{area.name} " + _("Destroy Success")
      rescue Exception => e
        flash[:errors] = e.message
      end      
      #      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
    end
    redirect_to :action => 'overview', :id => area.project
  end
end
