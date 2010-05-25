class ProjectsController < ApplicationController
  layout 'app'
  def new  
    @project = Project.new(params[:project])
    if request.post? and @project.save
      flash[:notice] = "项目：#{@project.name} 已经创建！"
      redirect_to :controller => 'dashboard', :action => 'index'
    end
  end

  def list
    
  end
end
