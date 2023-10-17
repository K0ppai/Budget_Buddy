require 'rails_helper'

RSpec.describe 'transfers/new', type: :feature do
  let(:user) { build(:user) }
  let(:group) { create(:group, user:) }

  describe "When creating a new group" do
    before :each do
      sign_in user
      visit new_group_transfer_path(group)
    end
    
    it "renders new group form" do
      fill_in "transfer_name", with: "Test"
      fill_in "transfer_amount", with: "10"
      select "KFC", from: 'group-select'
      click_on 'Save'
      expect(page).to have_text("KFC")
      expect(page).to have_text("10")
    end
  end
end
