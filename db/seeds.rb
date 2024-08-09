# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

50.times do
  Student.create({
    name: Faker::Name.name,
    cpf: Faker::IdNumber.brazilian_citizen_number(formatted: true),
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    payment_method: Student::PAYMENT_METHOD.sample
  })
end

100.times do
  Enrollment.create({
    amount: Faker::Number.between(from: 10000, to: 1000000),
    installments: Faker::Number.between(from: 1, to: 60),
    due_day: Faker::Number.between(from: 1, to: 31),
    student_id: Faker::Number.between(from: 1, to: 50)
  })
end

Enrollment.all.each do |enrollment|
  Bill.create_bills(enrollment)
end