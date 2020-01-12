class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  # before_action :set_location, only: [:new, :create, :edit, :update]

  def index
    if @user && !@user.photos.empty?
      @photos = User.find(@user.id).photos
    else
      redirect_to new_user_photo_path(@user)
    end    
  end

  def show
    @photo
  end

  def new
    @photo = Photo.new
    @user
  end

  def create
    @location = Location.find_or_create_by(city: params[:photo][:location][:city])
    @photo = Photo.new(photo_params)
    @photo.user = @user
    @photo.location = @location

    if @photo.save
      redirect_to user_photo_path(@user, @photo)
    else
      render :new
    end
  end

  def edit
    @photo
    # @location
  end

  def update
    # byebug
    @photo.update(caption: params[:photo][:caption])
    redirect_to user_photo_path(@user, @photo)
  end

  def destroy
    @photo.destroy
    redirect_to user_photos_path(@user)
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_location
    @location = Location.find_or_create_by(city: params[:photo][:location][:city])
  end
end