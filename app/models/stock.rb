class Stock < ApplicationRecord
  validates_uniqueness_of :name
end
