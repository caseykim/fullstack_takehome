FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }

    factory :user_with_videos do
      after(:create) do |user|
        3.times { create(:users_video, user: user) }
      end
    end
  end
end
