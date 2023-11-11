class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  
    render({ :template => "photos_templates/index" })
  end

  def show
    @the_photo = Photo.where({:id => params.fetch("photo_id")} ).first

@comments = Comment.where({:photo_id => params.fetch("photo_id")})

  render({ :template => "photos_templates/show" })
  end
  
def update
#get the photo
@the_photo = Photo.where({:id => params.fetch("photo_id")} ).first

#update

@the_photo.image = params.fetch("input_image")
@the_photo.caption = params.fetch("input_caption")
#save
@the_photo.save
  #redirect
    redirect_to("/photos/#{params.fetch("photo_id")}")
end

def destroy
  @the_photo = Photo.where({:id => params.fetch("photo_id")} ).first

#destroy
@the_photo.destroy

#redirect
redirect_to("/photos")
end

def add
#make new photo 
new_photo = Photo.new
#fill in data
new_photo.caption = params.fetch("input_caption")
new_photo.image = params.fetch("input_image")
new_photo.owner_id = params.fetch("input_owner_id")
#save
new_photo.save
#redirect
redirect_to("/photos/#{new_photo.id}")
end

def add_comment
  @the_photo = Photo.where({:id => params.fetch("input_photo_id")} ).first
#create new comment
new_comment = Comment.new
#enter values
new_comment.author_id = params.fetch("input_author_id")
new_comment.body = params.fetch("input_comment")

  #save
new_comment.save
redirect_to("/photos/#{@the_photo.id}")
end 

end
