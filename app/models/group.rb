class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :transfers, through: :transfer_groups
  has_many :transfer_groups
  has_one_attached :icon
end
