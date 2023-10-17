require "rails_helper"

RSpec.describe Transfer, type: :model do
  let(:user) { create(:user) }
  let(:transfer) { build(:transfer) }
  let(:group) { create(:group, user:) }

  context "when creating a new transfer" do
    before :each do
      DatabaseCleaner.clean
    end
    
    it "transfer should be valid" do
      expect(transfer).to be_valid
    end

    it "name should not be blank" do
      transfer.name = nil
      expect(transfer).not_to be_valid
    end

    it "amount should not be blank" do
      transfer.amount = nil
      expect(transfer).not_to be_valid
    end

    it "amount should be positive " do
      transfer.amount = -1
      expect(transfer).not_to be_valid
    end
  end

  context "when creating group transfers" do
    it "total amount should be the total of all transfers" do
      group.transfers.create(name: "test1", amount: 2, user:)
      group.transfers.create(name: "test1", amount: 4, user:)
      total = group.total_tranfers.to_f
      expect(total).to be 6.0
    end
  end
end
