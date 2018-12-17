class RemoveAnswerIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :answer_id, :string
  end
end
