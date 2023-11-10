class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})
  
    render({ :template => "users_templates/index" })
  end

  def show
  render({ :template => "users_templates/show" })
  end
  
end
