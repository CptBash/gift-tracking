# frozen_string_literal: true

# Gift model
class Gift < ApplicationRecord
  belongs_to :friend, inverse_of: :gifts
  validates :friend, presence: true
  validates :user, presence: true
  validates :name, presence: true
end
