class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})
  
    render({ :template => "users_templates/index" })
  end

  def show
    @the_user = User.where({:username => params.fetch("username")} ).first

  render({ :template => "users_templates/show" })
  end
  
end
