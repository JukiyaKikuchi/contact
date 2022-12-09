class CreateTeacherComments < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_comments do |t|
      t.references :user,         null: false, foreign_key: true
      t.references :parent_book,  null: false, foreign_key: true
      t.text :teacher_comment,    null: false
      t.string :teacher_name,     null: false

      t.timestamps
    end
  end
end
