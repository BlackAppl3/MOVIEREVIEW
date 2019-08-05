class Comment < ApplicationRecord
    validates :comment, presence: true, length: {maximum: 50}
end
