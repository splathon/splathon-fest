class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.belongs_to :fest, index: true, foreign_key: true, null: false
      t.string :alpha, limit: 32, null: false
      t.string :bravo, limit: 32, null: false

      t.timestamps
    end
  end
end
