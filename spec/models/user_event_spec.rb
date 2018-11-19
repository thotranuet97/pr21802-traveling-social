require "rails_helper"
RSpec.describe UserEvent, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:event) }
end
