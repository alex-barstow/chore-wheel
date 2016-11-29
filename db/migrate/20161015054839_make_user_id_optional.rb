class MakeUserIdOptional < ActiveRecord::Migration
  def up
    change_column :chores, :user_id, :integer, null: true
  end

  def down
    change_column :chores, :user_id, :integer, null: false
  end
end
