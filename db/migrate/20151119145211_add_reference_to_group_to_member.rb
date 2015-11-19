class AddReferenceToGroupToMember < ActiveRecord::Migration
  def change
    add_reference :members, :group, after: :uid, index: true
  end
end
