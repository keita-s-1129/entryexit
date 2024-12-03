class Address < ApplicationRecord
  validates :address, presence: true, uniqueness: true
end
