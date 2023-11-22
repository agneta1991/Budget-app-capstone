#  : true

class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  validate :valid_icon_format

  private

  def valid_icon_format
    return if icon.blank?

    unless icon.is_a?(String)
      errors.add(:icon, 'must be a string')
      return
    end

    unless icon.start_with?('https://') && (icon.end_with?('.png') || icon.end_with?('.jpg'))
      errors.add(:icon, 'As it is a link please start with https:// and it must have a valid format (either .png or .jpg)')
    end
  end
end
