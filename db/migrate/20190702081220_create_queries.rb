class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.string :email
      t.string :comment
      t.string :pending_status

      t.timestamps
    end
  end
end
