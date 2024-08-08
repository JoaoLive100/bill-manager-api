class Bill < ApplicationRecord
	belongs_to :enrollment

	STATUS = %w[
		open
		pending
		paid
	]
	validates :amount, presence: true, numericality: { greater_than: 0 }
	validates :due_date, presence: true, format: { with: /\d{4}-\d{2}-\d{2}/ }
	validates :status, presence: true, inclusion: { in: STATUS }
	def self.create_bills(enrollment)
		count = enrollment.installments
		amount = enrollment.amount / count
		due_day = enrollment.due_day.to_i
		due_month = enrollment.due_day.to_i <= Date.today.day ? 1 : 0

		count.times do |i|
			Bill.create(
				amount: amount,
				due_date: Date.new(Date.today.year, Date.today.month, due_day) + i.month + due_month.month,
				status: 'open',
				enrollment_id: enrollment.id
			)
		end
	end
end
