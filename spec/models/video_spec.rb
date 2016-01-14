require 'rails_helper'

describe Video do
  let(:video) { FactoryGirl.create(:video) }
  it 'should respond to users' do
    expect(video).to respond_to(:users)
  end

  it { should have_many(:users_videos) }
  it { should have_many(:users).through(:users_videos) }
end
