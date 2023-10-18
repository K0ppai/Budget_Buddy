class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :transfer_groups
  has_many :transfers, through: :transfer_groups
  has_one_attached :icon

  validates :name, presence: true, length: { in: 1..100 }
  validate :icon_is_image

  def total_tranfers
    transfers.sum(:amount)
  end

  private

  def icon_is_image
    if icon.attached? && !icon.image?
      errors.add(:icon, 'must be an image')
    elsif !icon.attached?
      errors.add(:icon, 'must be attached')
    end
  end
end
