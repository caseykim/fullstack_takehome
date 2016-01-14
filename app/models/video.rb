class Video < ActiveRecord::Base
  # How does a video relate to a user?
  # You should be able to run the following:
  #    Video.last.users
  has_many :users_videos
  has_many :users, through: :users_videos
end
