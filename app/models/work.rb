class Work < ApplicationRecord
  validates :work, presence: true, uniqueness: true
end
