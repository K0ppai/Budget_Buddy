require 'rails_helper'

RSpec.describe 'transfers/edit', type: :view do
  let(:transfer) do
    Transfer.create!(
      name: 'MyString',
      amount: '9.99',
      user: nil
    )
  end

  before(:each) do
    assign(:transfer, transfer)
  end

  it 'renders the edit transfer form' do
    render

    assert_select 'form[action=?][method=?]', transfer_path(transfer), 'post' do
      assert_select 'input[name=?]', 'transfer[name]'

      assert_select 'input[name=?]', 'transfer[amount]'

      assert_select 'input[name=?]', 'transfer[user_id]'
    end
  end
end
