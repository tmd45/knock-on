class ChangeColumnsToMember < ActiveRecord::Migration
  def change
    change_column :members, :provider, :string, null: true
    change_column :members, :uid, :string, null: true
  end
end
