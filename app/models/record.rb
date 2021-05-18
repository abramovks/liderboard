class Record < ApplicationRecord
    belongs_to :key
    validates :user_name, presence: true
    validates :score, presence: true
end
