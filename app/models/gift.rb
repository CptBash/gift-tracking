# frozen_string_literal: true

# Gift model
class Gift < ApplicationRecord
  # associations
  belongs_to :friend, inverse_of: :gifts

  # validates
  validates :friend, presence: true
  validates :name, presence: true
end
