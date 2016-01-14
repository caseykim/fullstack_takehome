class User < ActiveRecord::Base
  has_many :users_videos
  has_many :videos, through: :users_videos
end
