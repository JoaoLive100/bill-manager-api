class Student < ApplicationRecord
    has_many :enrollments

    PAYMENT_METHOD = %w[
        credit_card
        payment_slip
    ]
    validates :name, presence: true
    validates :cpf, presence: true, uniqueness:true
    validates :birthdate, presence: true
    validates :payment_method, presence: true, inclusion: { in: payment_method.keys }
end
