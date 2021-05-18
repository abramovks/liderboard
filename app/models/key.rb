class Key < ApplicationRecord
    validates_uniqueness_of :key
    has_many :records
end
