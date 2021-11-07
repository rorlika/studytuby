require "rails_helper"

RSpec.describe Bearer, type: :model do
  describe "ActiveModel validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { is_expected.to have_many(:stocks) }
  end
end
