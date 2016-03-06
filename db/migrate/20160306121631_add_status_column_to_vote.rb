class AddStatusColumnToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :status, :int, null: false, default: 0
  end
end
