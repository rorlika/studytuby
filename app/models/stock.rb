class Stock < ApplicationRecord
  belongs_to :bearer

  scope :active, -> { where(archive: false) }
  
  validates_uniqueness_of :name
end
