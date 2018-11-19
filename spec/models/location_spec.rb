require "rails_helper"
RSpec.describe Location, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:thumbnail) }
  it { is_expected.to validate_presence_of(:city) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:city) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:micro_posts) }
  it { is_expected.to have_many(:images) }
end
