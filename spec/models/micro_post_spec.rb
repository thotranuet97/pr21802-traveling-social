require "rails_helper"
RSpec.describe MicroPost, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:location) }
  it { is_expected.to have_many(:comments) }
end
