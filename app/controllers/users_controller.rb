class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({:username => :asc})
  
    render({ :template => "users_templates/index" })
  end

  def show
    @the_user = User.where({:username => params.fetch("username")} ).first

  render({ :template => "users_templates/show" })
  end
  
def add_user
new_user = User.new
new_user.username = params.fetch("input_username")  
  new_user.save
redirect_to("/users/#{new_user.username}")
end

def update
  #get the user
 @the_user = User.where({:id => params.fetch("user_id")} ).first
  
  #update
  
  @the_user.username = params.fetch("input_username")
  #save
  @the_user.save
    #redirect
      redirect_to("/users/#{@the_user.username}")
  end
### incorrect redirect line:
## redirect_to("/users/#{params.fetch("user_id")}
### DONT EVER DO THIS AGIAN!!!

end
