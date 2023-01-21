FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 10)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    how_old_id            {Faker::Number.within(range: 0..5) * 10}
    sex_id                {Faker::Number.within(range: 0..3)}
  end
end
