class Friend < ApplicationRecord
    belongs_to :user

    has_many :gifts
    validates :name, :birthday, presence: true
  end