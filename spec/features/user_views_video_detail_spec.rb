require 'rails_helper'

feature "User views a specific video", %(
  As a user
  I want to view a video's detail page
  So that I know how many users have watched the video

  Acceptance Criteria
  [x] I must visit the url of the video.id
  [x] I must see the video's title
  [x] I must see all users who watched the video
) do
  let!(:video) { FactoryGirl.create(:video_with_users) }

  scenario 'User visits video show page' do
    visit video_path(video)

    expect(page).to have_content video.title
    video.users.each do |user|
      expect(page).to have_content user.name
    end
  end
end
