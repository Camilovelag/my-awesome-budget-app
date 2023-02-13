class User < ApplicationRecord
  has_many :entities, foreign_key: 'author_id'
  has_many :groups

  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
end
