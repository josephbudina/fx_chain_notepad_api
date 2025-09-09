FactoryBot.define do
  factory :notes do
    title { Faker::Book.title }
    body { Faker::Quote.random }
  end
end
