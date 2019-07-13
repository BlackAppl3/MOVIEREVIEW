class Movieinfo < ApplicationRecord
    validates :moviename, presence: true, uniqueness: { :case_sensitive => false}, on: :create
    validates :moviename, presence: true, uniqueness: { :case_sensitive => false}, on: :update
    has_one_attached :image
end