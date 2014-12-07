class CreateUserCurrencies < ActiveRecord::Migration
  def change
    create_table :user_currencies do |t|
      t.integer :user_id
      t.string :name
      t.string :code
      t.string :country_id

      t.timestamps
    end
  end
end
