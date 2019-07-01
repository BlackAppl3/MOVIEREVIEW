class Information < ApplicationRecord
    validates :rating, :comment, presence: true
end
