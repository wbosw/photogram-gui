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


end
