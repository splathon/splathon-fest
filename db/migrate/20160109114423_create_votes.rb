class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :theme, index: true, foreign_key: true, null: false
      t.belongs_to :player, index: true, foreign_key: true, null: false
      t.integer :side, null: false

      t.timestamps
    end

    add_index :votes, [:theme_id, :player_id], unique: true
  end
end
