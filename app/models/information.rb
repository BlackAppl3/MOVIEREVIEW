class Information < ApplicationRecord
    validates :rating, :comment, presence: true
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    # belongs_to :user
    has_many :movieinfos
end