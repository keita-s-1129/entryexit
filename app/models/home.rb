class Home < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :supervisor

  validates :title,          presence: true
  validates :address_id,     presence: true
  validates :supervisor_id,  presence: true
end
