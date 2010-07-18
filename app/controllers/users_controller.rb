class UsersController < ApplicationController
  layout 'app'
  def add_user
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash.now[:notice] = _("user") + " #{@user.name} " + _("Created Success")
      @user = User.new
#      redirect_to :controller => 'dashboard', :action => 'index'
    end
  end
end
