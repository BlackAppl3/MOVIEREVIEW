class AddColToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :warning_count, :integer
  end
end
