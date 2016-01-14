class User < ActiveRecord::Base
  # How does a user relate to a video?
  # You should be able to run the following:
  #    User.last.videos
  has_many :users_videos
  has_many :videos, through: :users_videos
end
