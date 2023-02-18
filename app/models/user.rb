class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
end
