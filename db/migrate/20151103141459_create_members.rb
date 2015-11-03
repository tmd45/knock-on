class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :provider
      t.string :uid
      t.string :email
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
  end
end
