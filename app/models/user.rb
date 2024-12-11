class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many   :user_homes
  has_many   :homes, dependent: :destroy, through: :user_homes
  belongs_to :work

  validates :nickname,         presence: { message: "が空欄です！" }
  validates :first_name,       presence: { message: "が空欄です！" }
  validates :last_name,        presence: { message: "が空欄です！" }
  validates :first_name_kana,  presence: { message: "が空欄です！" }
  validates :last_name_kana,   presence: { message: "が空欄です！" }
  validates :birthday,         presence: { message: "が空欄です！" }
  validates :work_id,          numericality:  { message: "職種を選択して下さい！" }

end
