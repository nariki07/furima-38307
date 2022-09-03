class RemoveLastNameKanaFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :last_name_kana, :string
  end
end
