class Enrollment < ApplicationRecord
    belongs_to :student
    has_many :bills
end
