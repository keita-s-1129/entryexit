class Home < ApplicationRecord
  has_many :user_homes
  has_many :users, through: :user_homes

  belongs_to :user
  belongs_to :address
  belongs_to :supervisor

  validates :title,          presence: true
  validates :address_id,     presence: true
  validates :supervisor_id,  presence: true
end
