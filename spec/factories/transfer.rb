FactoryBot.define do
  factory :transfer do
    name { 'Snack' }
    amount { 22 }
    user
  end
end
