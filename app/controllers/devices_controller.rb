class DevicesController < ApplicationController
  layout 'base'

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
