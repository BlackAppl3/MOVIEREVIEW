class Movieinfo < ApplicationRecord
    validates :moviename, presence: true, on: :create
    validates :moviename, presence: true, on: :update
end