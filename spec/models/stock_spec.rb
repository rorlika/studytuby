require "rails_helper"

RSpec.describe Stock, type: :model do
  describe "ActiveModel validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { is_expected.to belong_to(:bearer) }
  end
end
