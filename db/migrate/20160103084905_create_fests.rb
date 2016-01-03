class CreateFests < ActiveRecord::Migration[5.0]
  def change
    create_table :fests do |t|
      t.string :name, limit: 255, null: false

      t.timestamps
    end
  end
end
