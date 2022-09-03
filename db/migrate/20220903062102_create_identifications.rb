class CreateIdentifications < ActiveRecord::Migration[6.0]
  def change
    create_table :identifications do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null:false
      t.string :first_name_kana, null:false
      t.date   :birthday, null:false   
      t.references   :user, foreign_key: true, null: false   
      t.timestamps
    end
  end
end
