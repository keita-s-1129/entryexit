class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :homes, dependent: :destroy
  belongs_to :work

  validates :nickname,         presence: true
  validates :first_name,       presence: true
  validates :last_name,        presence: true
  validates :first_name_kana,  presence: true
  validates :last_name_kana,   presence: true
  validates :birthday,         presence: true
  validates :work_id,          numericality:  { other_than: 1, only_integer: true, message: "can't be blank" }

end
