class VideosController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @videos = Video.sort_by_viewers.page params[:page]
      end
      format.json do
        @videos = Video.all
        video_names = @videos.map { |video| video.title }
        video_views = @videos.map { |video| video.users.count }

        render json: [video_names, video_views]
      end
    end
  end

  def show
    @video = Video.find(params[:id])
  end
end
