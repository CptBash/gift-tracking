# frozen_string_literal: true

# Friend model
class Friend < ApplicationRecord
  belongs_to :user
  has_many :gifts, inverse_of: :friend
  accepts_nested_attributes_for :gifts

  validates :name, :birthday, presence: true
  validate :future_birthday

  def future_birthday
    errors.add(:birthday, "can't be in the future") if birthday.present? && birthday > Date.today
  end
end
