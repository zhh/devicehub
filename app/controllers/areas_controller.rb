class AreasController < ApplicationController
  layout 'base'
  
  before_filter :projectlist

  def overview
    @project = Project.find(params[:id])
    @areas = Area.find_all_areas
  end

  def new
    @project = Project.find(params[:id])
    area = Area.new(params[:area])
    area.project_id = @project.id
    area.user_id = 1
    if request.post? and area.save
      flash[:notice] = _("area") + " #{area.name} " + _("Created Success")
      redirect_to :action => 'overview', :id => @project
    end
  end
end
