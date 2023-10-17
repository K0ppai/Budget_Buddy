require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  let(:user) { build(:user) }
  before :all do
    sign_in user
    visit new_group_path
  end

  it 'renders new group form' do
    
  end
end
