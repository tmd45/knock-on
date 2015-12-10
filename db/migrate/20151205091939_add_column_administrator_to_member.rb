class AddColumnAdministratorToMember < ActiveRecord::Migration
  def change
    add_column :members, :administrator, :boolean
  end
end
