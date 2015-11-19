class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :name_kana
      t.integer :order, default: 0

      t.timestamps null: false
    end

    add_index :groups, :order, name: :idx_groups_order
  end
end
