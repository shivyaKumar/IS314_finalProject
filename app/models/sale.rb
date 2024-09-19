class Sale < ApplicationRecord
  belongs_to :variant
  validates :quantity, presence: true
end
