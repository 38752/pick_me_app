FactoryBot.define do
  factory :hima do
    title         {Faker::Lorem.sentence}
    location      {Faker::Lorem.word}
    text          {Faker::Lorem.paragraph(sentence_count: 3)}
    open_range_id {Faker::Number.within(range: 1..1) * 10}

    association :user
  end
end
