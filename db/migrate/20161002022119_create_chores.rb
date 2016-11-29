class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name, null: false
      t.text :description
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
