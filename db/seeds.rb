# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do
  Lesson.create!( title: Faker::ProgrammingLanguage.name,
                  price: Faker::Number.between(from: 100, to: 500),
                  currency: Faker::Currency.code,
                  category: "English",
                  status: "available",
                  url: Faker::Internet.url,
                  description: Faker::Books::Lovecraft.sentences,
                  expired_days: Faker::Number.between(from: 1, to: 31),
                  manager_id: Faker::Number.between(from: 1, to: 3))
end

2.times do
  Lesson.create!( title: Faker::ProgrammingLanguage.name,
                  price: Faker::Number.between(from: 100, to: 1000),
                  currency: Faker::Currency.code,
                  category: "Math",
                  status: "available",
                  url: Faker::Internet.url,
                  description: Faker::Books::Lovecraft.sentences,
                  expired_days: Faker::Number.between(from: 1, to: 31),
                  manager_id: Faker::Number.between(from: 1, to: 3))
end

2.times do
  Lesson.create!( title: Faker::ProgrammingLanguage.name,
                  price: Faker::Number.between(from: 100, to: 500),
                  currency: Faker::Currency.code,
                  category: "Programming",
                  status: "unavailable",
                  url: Faker::Internet.url,
                  description: Faker::Books::Lovecraft.sentences,
                  expired_days: Faker::Number.between(from: 1, to: 31),
                  manager_id: Faker::Number.between(from: 1, to: 3))
end

Order.create!(  lesson_id: "1",
                user_id: "2",
                checkout_time: Faker::Date.in_date_period(year: 2020, month: 3),
                expired_time: Faker::Date.in_date_period(year: 2020, month: 4),
                total: 26755,
                currency: "RSD")

Order.create!(  lesson_id: "1",
                user_id: "1",
                checkout_time: Faker::Date.in_date_period(year: 2020, month: 3),
                expired_time: Faker::Date.in_date_period(year: 2020, month: 4),
                total: 26755,
                currency: "RSD")

Order.create!(  lesson_id: "1",
                user_id: "1",
                checkout_time: Faker::Date.in_date_period(year: 2020, month: 3),
                expired_time: Faker::Date.in_date_period(year: 2020, month: 4),
                total: 26755,
                currency: "RSD")

Order.create!(  lesson_id: "2",
                user_id: "2",
                checkout_time: Faker::Date.in_date_period(year: 2020, month: 3),
                expired_time: Faker::Date.in_date_period(year: 2020, month: 4),
                total: 362,
                currency: "MDL")
