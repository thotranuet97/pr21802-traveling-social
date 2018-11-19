require "rails_helper"
RSpec.describe User, type: :model do
  it { is_expected.to have_many(:images) }
  it { is_expected.to have_many(:events) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:micro_posts) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:cities) }
  it { is_expected.to have_many(:locations) }
end
