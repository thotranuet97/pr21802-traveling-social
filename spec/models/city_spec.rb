require "rails_helper"
RSpec.describe City, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:thumbnail) }
  it { is_expected.to have_many(:locations) }
end
