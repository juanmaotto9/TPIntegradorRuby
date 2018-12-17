class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :screen_name
      t.string :email
      t.string :token
      t.references :Answer, foreign_key: true
      t.references :Question, foreign_key: true

      t.timestamps
    end
  end
end
