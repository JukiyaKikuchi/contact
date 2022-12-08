class CreateParentBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :parent_books do |t|
      t.string :parent_name,         null: false
      t.text :parent_comment,        null: false
      t.string :temperature
      t.string :breakfast
      t.string :greeted_name
      t.string :tell_number
      t.integer :mood_id
      t.integer :attendance_id,      null: false
      t.integer :greeted_time_id
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
