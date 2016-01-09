class AddStatusColumnToTheme < ActiveRecord::Migration[5.0]
  def change
    add_column :themes, :status, :int, null: false, default: 0
  end
end
