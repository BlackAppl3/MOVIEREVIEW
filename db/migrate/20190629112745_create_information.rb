class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :movieno
      t.string :email
      t.string :comment
      t.integer :rating

      t.timestamps
    end
  end
end
