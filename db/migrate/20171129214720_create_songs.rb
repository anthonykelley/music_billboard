class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.float :duration, null: false
      t.string :genre, null: false
      t.string :album, null: false

      t.timestamps
    end
  end
end
