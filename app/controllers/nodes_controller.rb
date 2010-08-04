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
    @nodes = Node.find_all_project_nodes(@project)
  end

  def list_for_area
    @nav = "nodes_overview"
    @action = "node_new"
    @area = Area.find(params[:id])
    @project = @area.project
  end

  def newareanode
    area = Area.find(params[:id])
    @project = area.project
    @node = Node.new(params[:node])
    @node.user_id = 1
    if request.post? and area.nodes << @node
      flash[:notice] = _("node") + " #{@node.name} " + _("Created Success")
      redirect_to :action => 'areanodes', :id => area
    end
  end

  def new
    @nav = "nodes_overview"
    @action = "node_new"
    @project = Project.find(params[:id])
    @node = Node.new(params[:node])
    @node.user_id = 1
    if request.post? and @node.save
      flash[:notice] = _("node") + " #{@node.name} " + _("Created Success")
      redirect_to :action => 'list', :id => @project
    end
  end

  def edit
    @node = Node.find(params[:id])
    @project = @node.area.project
    @destroy_obj = @node
    if request.post? and @node.update_attributes(params[:node])
      flash[:notice] = _("Update Success")      
      redirect_to :action => 'overview', :id => @project
    end
  end

  def destroy
    if request.post?
      node = Node.find(params[:id])
      node.destroy
      flash[:notice] = _("node") + " #{node.name} " + _("Destroy Success")
#      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
    end    
    redirect_to :action => :overview, :id => node.area.project
  end
end
