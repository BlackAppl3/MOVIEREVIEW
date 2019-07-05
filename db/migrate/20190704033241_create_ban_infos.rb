class CreateBanInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :ban_infos do |t|
      t.string :moviename
      t.string :comment
      t.integer :rating
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
