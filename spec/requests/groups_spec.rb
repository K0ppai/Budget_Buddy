require "rails_helper"

RSpec.describe "/groups", type: :request do
  let(:user) { build(:user) }
  let(:group) { create(:group) }
  let(:valid_attributes) do
    {
      name: 'Group',
      user:,
      icon: fixture_file_upload('./spec/fixtures/files/kfc.png', 'image/jpeg'),
    }
  end
  let(:invalid_attributes) do
    {
      name: 'Group'
    }
  end

  before :each do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get groups_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get group_url(group)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_group_url
      expect(response).to be_successful
    end

    it "renders a correct template" do
      get new_group_url
      expect(response).to render_template(:new)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_group_url(group)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Group" do
        expect do
          post groups_url, params: { group: valid_attributes }
        end.to change(Group, :count).by(1)
      end

      it "redirects to the created group" do
        post groups_url, params: { group: valid_attributes }
        expect(response).to redirect_to(group_url(Group.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Group" do
        expect do
          post groups_url, params: { group: invalid_attributes }
        end.to change(Group, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post groups_url, params: { group: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
