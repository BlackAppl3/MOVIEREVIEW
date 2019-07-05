class AddBanToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ban, :boolean
  end
end
