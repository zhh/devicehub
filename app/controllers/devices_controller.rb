class DevicesController < ApplicationController
  layout 'base'

  def list
    @nav = "devices_list"
    @action = "device_new"
    @project = Project.find(params[:id])
    @devices = Device.find_all_devices_for_project(@project)
  end

  def list_for_area
    @nav = "devices_list"
    @action = "device_new"
    @area = Area.find(params[:id])
    @project = @area.project
    @devices = Device.find_all_devices_for_area(@area)
    render :action => 'list'
  end

  def list_for_node
    @nav = "devices_list"
    @action = "device_new"
    @node = Node.find(params[:id])
    @project = @node.area.project
    @devices = Device.find_all_devices_for_node(@node)
    render :action => 'list'
  end

  def new
    @nav = "devices_list"
    @action = "device_new"
    @project = Project.find(params[:id])
    @areas = Area.project_areas_to_array(@project)
    @nodes = []
    @device = Device.new(params[:device])
    @device.user_id = 1
    if request.post? and @device.save
      flash[:notice] = _("device") + " #{@device.name} " + _("Created Success")
      redirect_to :action => :list, :id => @project
    end
  end

  def edit
    @nav = "devices_list"
    @action = "device_destroy_move"
    @device = Device.find(params[:id])
    @project = @device.area.project
    @areas = Area.project_areas_to_array(@project)
    @nodes = Node.area_nodes_to_array(@device.area)
    @destroy_obj = @device
    if request.post? and @device.update_attributes(params[:device])
      flash[:notice] = _("device") + " #{@device.name} " + _("Update Success")
      redirect_to :action => 'list', :id => @project
    end
  end

  def move
    edit
  end

  def destroy
    device = Device.find(params[:id])
    if request.post?
      begin
        device.destroy
        flash[:notice] = _("device") + " #{device.name} " + _("Destroy Success")
      rescue Exception => e
        flash[:errors] = e.message
      end
      #      logger.info("#{Time.now} 删除 项目 ID ##{project.id}!")
    end
    redirect_to :action => 'list', :id => device.area.project
  end

  def node_select
    @nodes = Node.area_nodes_to_array(params[:area_id])
    render(:layout => false)
  end

  def index
    render :action => 'new_devicetype'
  end

  def new_devicetype
    @devicetype = Devicetype.new(params[:devicetype])
    if request.post? and @devicetype.save
      flash[:notice] = "设备类型：#{@devicetype.name} 已经创建！"
      @devicetype = Devicetype.new
    end
  end
end
