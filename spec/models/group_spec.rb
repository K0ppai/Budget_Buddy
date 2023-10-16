require "rails_helper"

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }
  let(:group_without_icon) { build(:group_without_icon) }
  let(:group_with_non_image_icon) { build(:group_with_non_image_icon) }

  context "When creating a new group" do
    it "group should be valid" do
      expect(group).to be_valid
    end

    it "name should not be blank" do
      group.name = nil
      expect(group).not_to be_valid
    end

    it "name should not be longer than 100" do
      group.name = 'a' * 101
      expect(group).not_to be_valid
    end

    it "is invalid without an icon" do
      expect(group_without_icon).not_to be_valid
      expect(group_without_icon.errors[:icon]).to include("must be attached")
    end

    it "is invalid with a non-image icon" do
      expect(group_with_non_image_icon).not_to be_valid
      expect(group_with_non_image_icon.errors[:icon]).to include("must be an image")
    end
  end
end
