require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :feature do
  let(:user) { build(:user) }
  let!(:group) { create(:group, user:) }

  describe 'Testing group index page' do
    before :each do
      sign_in user
      visit groups_path
    end

    context 'When visiting index page' do
      it 'should see group name' do
        expect(page).to have_text(group.name)
      end

      it 'should see group icon with alt attribute' do
        expect(page).to have_css("img[alt='#{group.name}']")
      end

      it 'should see the amount of all the transfers' do
        group.transfers.create(user:, name: 'KFC Snack', amount: 10.00)
        group.transfers.create(user:, name: 'KFC Snack2', amount: 15.00)
        visit groups_path
        expect(page).to have_text('25')
      end
    end

    context 'When clicking add new group' do
      it 'should visit group new page' do
        find('#new-group-btn').click
        expect(current_path).to eq(new_group_path)
      end
    end

    context 'When clicking on a group' do
      it 'should navigate to show page' do
        click_on group.name
        expect(current_path).to eq(group_path(group))
      end
    end
  end
end
