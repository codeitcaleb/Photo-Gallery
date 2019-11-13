class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    # byebug
  end

  def show
    @photo = Photo.find(params[:id])
    redirect_to photo_path(@photo)
  end

  def new
    @photo = Photo.new
    @photo.tag_photos.build
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption, 
    tag_photos_attributes: [:title]
    )
  end
end
