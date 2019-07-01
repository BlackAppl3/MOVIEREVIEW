class CreateMovieinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :movieinfos do |t|
      t.string :moviename

      t.timestamps
    end
  end
end
