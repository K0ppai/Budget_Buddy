class CreateTransferGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :transfer_groups do |t|
      t.references :transfer, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
