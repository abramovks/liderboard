class Key < ApplicationRecord
    validates_uniqueness_of :key
end
