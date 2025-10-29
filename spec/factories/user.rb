FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.rand }
    password_digest { Faker::Internet.password }
    avatar_url { Faker::Internet.password }

    to_create(&:save)
  end
end
