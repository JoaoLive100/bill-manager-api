class Student < ApplicationRecord
  has_many :enrollments

  PAYMENT_METHOD = %w[
    credit_card
    boleto
  ]
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness:true, format: { with: /\d{3}\.\d{3}\.\d{3}-\d{2}/ }
  validates :birthdate, allow_nil: true, format: { with: /\d{4}-\d{2}-\d{2}/ }
  validates :payment_method, presence: true, inclusion: { in: PAYMENT_METHOD }
end
