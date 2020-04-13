# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  Lesson.create!( title: Faker::ProgrammingLanguage.name,
                  price: Faker::Number.between(from: 100, to: 500),
                  currency: Faker::Currency.code,
                  category: Faker::Games::Pokemon.name,
                  status: "launch",
                  url: Faker::Internet.url,
                  description: Faker::Books::Lovecraft.sentences,
                  expired_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today + 5, period: :all),
                  manager_id: Faker::Number.between(from: 1, to: 10))
end

3.times do
  Lesson.create!( title: Faker::ProgrammingLanguage.name,
                  price: Faker::Number.between(from: 100, to: 500),
                  currency: Faker::Currency.code,
                  category: Faker::Games::Pokemon.name,
                  status: "soldOut",
                  url: Faker::Internet.url,
                  description: Faker::Books::Lovecraft.sentences,
                  expired_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today + 5, period: :all),
                  manager_id: Faker::Number.between(from: 1, to: 10))
end
