class ProjectsController < ApplicationController
  layout 'app'
  def new  
    @projects = Project.new(params[:project])
    if request.post? and @projects.save
      flash[:notice] = "项目：#{@projects.name} 已经创建！"
      @projects = Project.new
    end
  end
end
