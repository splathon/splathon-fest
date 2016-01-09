class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.belongs_to :fest, index: true, foreign_key: true, null: false
      t.string :name, limit: 16, null: false

      t.timestamps
    end
  end
end
