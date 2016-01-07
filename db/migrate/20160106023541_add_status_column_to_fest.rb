class AddStatusColumnToFest < ActiveRecord::Migration[5.0]
  def change
    add_column :fests, :status, :int, null: false, default: 0
  end
end
