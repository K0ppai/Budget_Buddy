require "rails_helper"

RSpec.describe "/transfers", type: :request do
  let(:user) { build(:user) }
  let(:group) { create(:group) }

  before :each do
    sign_in user
    get new_group_transfer_path(group)
  end

  describe "GET /new" do
    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "should render the correct template" do
      expect(response).to render_template(:new)
    end
  end
end
