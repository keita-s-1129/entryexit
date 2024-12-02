class Home < ApplicationRecord
  belongs_to :user

  validates :title,      presence: true
  
  validates :address_id, numericality:      { other_than: 1, only_integer: true, message: "can't be blank" }
  validates :supervisor_id, numericality:   { other_than: 1, only_integer: true, message: "can't be blank" }
end
