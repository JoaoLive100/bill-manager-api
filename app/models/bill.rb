class Bill < ApplicationRecord
    bellongs_to :enrollment

    STATUS = %w[
        open
        pending
        paid
    ]
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :due_date, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/ }
    validates :status, presence: true, inclusion: { in: STATUS }, default: 'open'
end
