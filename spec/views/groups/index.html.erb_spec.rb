require "rails_helper"

RSpec.describe "groups/index.html.erb", type: :feature do
  let(:user) { build(:user) }
  let!(:group) { create(:group, user:) }
  
  describe "Testing group index page" do
    before :each do
      sign_in user
      visit groups_path
    end

    context "When visiting index page" do
      it "should see group name" do
        expect(page).to have_text(group.name)
      end

      it "should see group icon with alt attribute" do
        expect(page).to have_css("img.w-25[alt='#{group.name}']")
      end
      
      it "should see the amount of all the transfers" do
        create(:transfer, name: 'test', amount: 2, user:, groups: [group])
        create(:transfer, name: 'test', amount: 4, user:, groups: [group])
        expect(page).to have_text(group.total_transfers.to_s)
      end
    end
  end
end
