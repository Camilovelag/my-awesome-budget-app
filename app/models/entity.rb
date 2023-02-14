class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entity_groups

  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
end
