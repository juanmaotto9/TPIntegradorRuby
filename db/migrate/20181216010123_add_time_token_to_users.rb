class AddTimeTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :time_token, :datetime
  end
end
