FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    first_name            {person.first.kanji}
    last_name             {person.last.kanji}
    first_name_kana       {person.first.katakana}
    last_name_kana        {person.last.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end