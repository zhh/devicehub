class NodesController < ApplicationController
  layout 'base'

  before_filter :projectlist

  def overview
    @project = Project.find(params[:id])
    @nodes = Node.find_all_project_nodes(@project)
  end

  def areanodes
    @area = Area.find(params[:id])
    @project = @area.project
  end

  def newareanode
    area = Area.find(params[:id])
    @project = area.project
    node = Node.new(params[:node])
    node.area = area
    node.user_id = 1
    if request.post? and area.nodes << node
      flash[:notice] = _("node") + " #{node.name} " + _("Created Success")
      redirect_to :action => 'areanodes', :id => area
    end
  end
end
