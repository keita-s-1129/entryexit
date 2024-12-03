class Supervisor < ApplicationRecord
  validates :supervisor, presence: true, uniqueness: true
end
