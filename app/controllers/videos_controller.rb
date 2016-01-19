class VideosController < ApplicationController
  def index
    @videos = Video.sort_by_viewers.page params[:page]
    respond_to do |format|
      format.html
      format.json do
        video_names = @videos.map { |video| video.title }
        video_views = @videos.map { |video| video.users.count }

        render json: [video_names, video_views]
      end
    end
  end

  def show
    @video = Video.find(params[:id])
    @users = @video.users.page params[:page]
  end
end
