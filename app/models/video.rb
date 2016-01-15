class Video < ActiveRecord::Base
  # How does a video relate to a user?
  # You should be able to run the following:
  #    Video.last.users
  has_many :users_videos
  has_many :users, through: :users_videos
  scope :sort_by_viewers, -> {
    joins(:users).
    select("videos.*", "count(users.id) AS views_count").
    group("videos.id").
    order("views_count DESC")
  }

  paginates_per 12
end
