class Bearer < ApplicationRecord
  validates_uniqueness_of :user_name
end
