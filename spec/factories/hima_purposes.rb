FactoryBot.define do
  factory :hima_purpose do
    flag       {Faker::Number.within(range: 0..1)}
  end
end
