# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :user
  has_many :group_entities, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: { allow_float: true, greater_than_or_equal_to: 0 }
end
