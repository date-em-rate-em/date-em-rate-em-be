FactoryBot.define do
  factory :review do
    user { nil }
    client { nil }
    body { "MyText" }
  end
end
