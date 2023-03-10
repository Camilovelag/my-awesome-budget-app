class Group < ApplicationRecord
  has_one_attached :icon
  belongs_to :user
  has_many :entity_groups

  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :icon, presence: true, allow_blank: false
end
