# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
