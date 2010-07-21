class AreasController < ApplicationController
  layout 'base'
  
  before_filter :projectlist

  def overview
    @project = Project.find(params[:id])
  end
end
