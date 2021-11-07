FactoryBot.define do
  factory :stock do
    sequence(:name) { |n| "Stock #{n}" }
    bearer { create(:bearer) }
  end
end
