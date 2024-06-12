# frozen_string_literal: true

# Gift model
class Gift < ApplicationRecord
  # associations
  belongs_to :friend, inverse_of: :gifts
  belongs_to :user

  # validates
  validates :friend, presence: true
  validates :user, presence: true
  validates :name, presence: true
end
