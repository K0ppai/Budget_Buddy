FactoryBot.define do
  factory :group do
    name { "Group" }
    association :user, factory: :user

    after(:build) do |group|
      group.icon.attach(io: File.open("./spec/fixtures/files/kfc.png"), filename: "kfc.png", content_type: "image/png")
    end
  end

  factory :group_without_icon, class: "Group" do
    name { "Group Without Icon" }
    association :user, factory: :user
  end

  factory :group_with_non_image_icon, class: "Group" do
    name { "Group With Non-Image Icon" }
    association :user, factory: :user

    after(:build) do |group|
      group.icon.attach(io: File.open("./spec/fixtures/files/test.txt"), filename: "test.txt", content_type: "text/plain")
    end
  end
end
