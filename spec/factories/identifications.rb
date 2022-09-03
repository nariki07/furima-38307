FactoryBot.define do
  factory :identification do
    last_name             {"田中"}
    first_name            {"一郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"イチロウ"}
    birthday              {Faker::Date.backward}
  end
end
