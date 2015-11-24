class AddTitleToMember < ActiveRecord::Migration
  def change
    add_column :members, :title, :string
    add_column :members, :title_alphabet, :string
  end
end
