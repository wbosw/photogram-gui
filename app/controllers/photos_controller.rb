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
  
end
