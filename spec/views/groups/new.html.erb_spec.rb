require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  let(:user) { create(:user) }

  describe 'When creating a new group' do
    before :each do
      sign_in user
      visit new_group_path
    end

    it 'renders new group form' do
      fill_in 'group_name', with: 'Test'
      attach_file 'group[icon]', Rails.root.join('spec/fixtures/files/kfc.png')
      click_on 'Save'
      expect(page).to have_text('Test')
    end
  end
end
