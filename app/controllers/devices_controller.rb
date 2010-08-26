class DevicesController < ApplicationController
  layout 'base'

  def list
    @nav = "devices_overview"
    @action = "device_new"
    @project = Project.find(params[:id])
    @devices = Device.find_all_devices_for_project(@project)
  end

  def list_for_area
    @nav = "devices_overview"
    @action = "device_new"
    @area = Area.find(params[:id])
    @project = @area.project
    @devices = Device.find_all_devices_for_area(@area)
    render :action => 'list'
  end

  def list_for_node
    @nav = "devices_overview"
    @action = "device_new"
    @node = Node.find(params[:id])
    @project = @node.area.project
    @devices = Device.find_all_devices_for_node(@node)
    render :action => 'list'
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
