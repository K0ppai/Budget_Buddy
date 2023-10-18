class Transfer < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :transfer_groups
  has_many :groups, through: :transfer_groups

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
