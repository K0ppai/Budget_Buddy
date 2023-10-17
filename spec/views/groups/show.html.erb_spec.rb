require "rails_helper"

RSpec.describe "groups/show", type: :feature do
  let(:user) { build(:user) }
  let!(:group) { create(:group, user:) }

  before :each do
    @transfer = group.transfers.create(user:, name: "KFC Snack", amount: 10.00)
    @transfer2 = group.transfers.create(user:, name: "KFC Snack2", amount: 15.00)
    sign_in user
    visit group_path(group)
  end

  context "When visiting show page" do
    it "should see the name of each transaction" do
      expect(page).to have_text(@transfer.name)
      expect(page).to have_text(@transfer2.name)
    end
    
    it "should see the amount of each transaction" do
      expect(page).to have_text(@transfer.amount)
      expect(page).to have_text(@transfer2.amount)
    end
    
    it "should see the total amount of all the transaction" do
      expect(page).to have_text(group.total_tranfers)
    end
  end

  context "When clicking on new transfer btn" do
    it "should navigate to new transfer path" do
      find('#new-transfer-btn').click
      expect(current_path).to eq(new_group_transfer_path(group_id: group))
    end
  end
end
