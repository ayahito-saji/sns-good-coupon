class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider,           null: false
      t.string :uid,                null: false
      t.string :user_name,          null: false
      t.string :consumer_key,       null: false
      t.string :consumer_secret,    null: false
      t.string :key,                null: false
      t.string :secret,             null: false

      t.timestamps
    end
  end
end
