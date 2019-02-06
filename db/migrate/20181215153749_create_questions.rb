class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.boolean :status
      t.references :user#, foreign_key: true
      t.references :answer#, foreign_key: true

      t.timestamps

      #las foreign_keys fueron comentadas junto a Lautaro para que funcione en heroku.
    end
  end
end
