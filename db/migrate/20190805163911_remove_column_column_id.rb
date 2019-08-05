class RemoveColumnColumnId < ActiveRecord::Migration[5.2]
  
  def up
    add_column :comments, :likes, :integer
    remove_column :comments, :comment_id
  end

  def down  
    add_column :comments, :likes, :integer
  end

end
