require 'rails_helper'

feature "User views all videos", %(
  As a user
  I want to view all videos
  So that I can see them all in index page

  Acceptance Criteria
  [x] I must see the name of each video
  [x] I should see links to the show page for each resouce
) do

  before do
    5.times { FactoryGirl.create(:video) }
  end

  scenario 'user views all videos' do
    visit videos_path

    Video.all.each do |video|
      expect(page).to have_content video.title
    end
  end

  scenario 'user clicks on a resource and is directed to detail page' do
    visit videos_path

    Video.all.each do |video|
      expect(page).to have_link(video.title, href: video_path(video))
    end

    find_link(Video.first.title).click
    expect(current_path).to eq video_path(Video.first)
  end
end
