class CreateUserCountries < ActiveRecord::Migration
  def change
    create_table :user_countries do |t|
      t.integer :user_id
      t.string :name
      t.string :code
      t.boolean :visited, :defalut=>false

      t.timestamps
    end
  end
end
