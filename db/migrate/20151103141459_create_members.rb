class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :provider, null: false
      t.string :uid,      null: false
      t.string :email,    null: false
      t.string :given_name
      t.string :given_name_kana
      t.string :given_name_alphabet
      t.string :family_name
      t.string :family_name_kana
      t.string :family_name_alphabet
      t.string :image_url
      t.string :slack_identifier

      t.timestamps null: false
    end

    add_index :members, [ :provider, :uid ], unique: true, name: :idx_members_provider_uid
    add_index :members, :email, unique: true, name: :idx_members_email
  end
end
