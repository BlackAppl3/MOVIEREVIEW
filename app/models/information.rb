class Information < ApplicationRecord
    validates :rating, :comment, presence: true
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}


    # validates :rating, :comment, presence: true, on: :update
    # validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}, on: :update
    # belongs_to :user
    has_many :movieinfos
end