class Transfer < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :groups, through: :transfer_groups
  has_many :transfer_groups
end
