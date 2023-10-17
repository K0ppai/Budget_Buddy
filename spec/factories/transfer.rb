FactoryBot.define do
  factory :transfer do
    name { 'Snack' }
    amount { 22 }
    association :user, factory: :user
    association :group, factory: :group
  end
end
