class NodesController < ApplicationController
  layout 'base'

  before_filter :projectlist

  def overview
    @nav = "nodes_overview"
    @action = "node_new"
    @project = Project.find(params[:id])
    @nodes = Node.find_all_project_nodes(@project)
  end

  def list
    @nav = "nodes_overview"
    @action = "node_new"
    @project = Project.find(params[:id])
    @nodes = Node.find_all_nodes_for_project(@project)
  end

  def list_for_area
    @nav = "nodes_overview"
    @action = "node_new"
    @area = Area.find(params[:id])
    @project = @area.project
    @nodes = Node.find_all_nodes_for_area(@area)
    render :action => 'list'
  end 

  def new
    @nav = "nodes_overview"
    @action = "node_new"
    @project = Project.find(params[:id])
    @areas = Area.project_areas_area_to_array(@project)
    @node = Node.new(params[:node])    
    @node.user_id = 1
    if request.post? and @node.save
      flash[:notice] = _("node") + " #{@node.name} " + _("Created Success")
      redirect_to :action => :list, :id => @project
    end
  end

  def new_for_area
    @nav = "nodes_overview"
    @action = "node_new_for_area"
    @area = Area.find(params[:id])
    @project = @area.project
    @node = Node.new(params[:node])
    @node.user_id = 1
    if request.post? and @area.nodes << @node
      flash[:notice] = _("node") + " #{@node.name} " + _("Created Success")
      redirect_to :action => :list_for_area, :id => @area
    end
  end

  def edit
    @nav = "nodes_overview"
    @action = "node_destroy_move"
    @node = Node.find(params[:id])
    @area = @node.area
    @project = @area.project
    @areas = Area.project_areas_area_to_array(@project)
    @destroy_obj = @node
    if request.post? and @node.update_attributes(params[:node])
      flash[:notice] = _("Update Success")      
      redirect_to :action => 'list_for_area', :id => @area
    end
  end

  def move    
    edit
  end

  def destroy
    node = Node.find(params[:id])
    if request.post?      
      node.destroy
      flash[:notice] = _("node") + " #{node.name} " + _("Destroy Success")
#      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
    end    
    redirect_to :action => :list, :id => node.area.project
  end

  def before_destroy
    raise _("node_destroy_fail_for_devices") unless self.devices.empty?
  end
end
