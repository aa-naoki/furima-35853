FactoryBot.define do
  factory :user do
    
    email                 {Faker::Internet.email}
    nickname              {Faker::Name.first_name}
    gimei = Gimei.name
    first_name            {gimei.first.kanji}
    last_name             {gimei.last.kanji}
    first_pseudonym       {gimei.first.katakana}
    last_pseudonym        {gimei.last.katakana}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
  end
end