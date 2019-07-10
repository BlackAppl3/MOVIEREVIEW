class Contact < ApplicationRecord
    validates :email, :comment, presence: true, on: :create
end
