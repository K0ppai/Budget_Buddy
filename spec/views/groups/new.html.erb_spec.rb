require "rails_helper"

RSpec.describe "groups/new", type: :feature do
  let(:user) { create(:user) }

  describe "When creating a new group" do
    before :each do
      sign_in user
      visit new_group_path
    end
    
    it "renders new group form" do
      fill_in "group_name", with: "Test"
      attach_file "Icon", Rails.root.join("spec/fixtures/files/kfc.png")
      click_on "Create Group"
      expect(page).to have_text("Test")
    end
  end
end
