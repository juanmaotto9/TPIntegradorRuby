class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.string :content
      t.references :user, foreign_key: true
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
