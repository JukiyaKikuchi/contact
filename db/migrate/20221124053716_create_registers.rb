class CreateRegisters < ActiveRecord::Migration[6.0]
  def change
    create_table :registers do |t|
      t.string :title,               null: false
      t.text   :general_comment,     null: false
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
