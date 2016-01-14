FactoryGirl.define do
  factory :video do
    title { FFaker::HipsterIpsum.words(4).join(' ') }

    factory :video_with_users do
      after(:create) do |video|
        3.times { create(:users_video, video: video) }
      end
    end
  end

  factory :users_video do
    user
    video
  end
end
