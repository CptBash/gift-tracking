class Friend < ApplicationRecord
    belongs_to :user

    has_many :gifts
    validates :name, :birthday, presence: true

    # accept nested attributes for gifts
    accepts_nested_attributes_for :gifts, reject_if: :all_blank, allow_destroy: true
  end