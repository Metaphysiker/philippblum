class VideosController < ApplicationController
  before_action :user_allowed?, except: :getvideo
  #Index action, photos gets listed in the order at which they were created
  def index
    @videos = Video.all
  end

  #New action for creating a new photo
  def new
    @video = Video.new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      flash[:notice] = "Successfully updated video!"
      redirect_to videos_path
    else
      render :edit
    end
  end
  #Create action ensures that submitted photo gets created if it meets the requirements
  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:notice] = "Successfully added new video!"
      redirect_to videos_path
    else
      flash[:alert] = "Error adding new video!"
      render :new
    end
  end

  def destroy
    @video= Video.find(params[:id])
    if @video.destroy
      flash[:notice] = "Successfully deleted video!"
      redirect_to root_path
    else
      flash[:alert] = "Error deleting photo!"
    end
  end

  def getvideo
    url = params[:url]

    unless url.nil?
      video = Video.find_by_url(url)
      redirect_to video.file.url(:original, false)
    end

  end

  private

  #Permitted parameters when creating a photo. This is used for security reasons.
  def video_params
    params.require(:video).permit(:title, :video)
  end
end
