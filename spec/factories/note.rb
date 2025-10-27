FactoryBot.define do
  factory :notes do
    title { Faker::Book.title }
    body { Faker::Quote.rand }

    to_create(&:save)
  end
end
