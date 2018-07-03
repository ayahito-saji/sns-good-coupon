class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider,           null: false
      t.string :uid,                null: false
      t.string :name,               null: false
      t.string :key,                null: false
      t.string :secret,             null: false

      t.timestamps
    end
  end
end
