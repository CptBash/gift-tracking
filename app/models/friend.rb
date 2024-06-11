# frozen_string_literal: true

# Friend model
class Friend < ApplicationRecord
  belongs_to :user

  has_many :gifts
  validates :name, :birthday, presence: true

  # accept nested attributes for gifts
  accepts_nested_attributes_for :gifts, allow_destroy: true
end
