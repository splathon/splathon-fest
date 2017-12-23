create_table 'fests', options: DEFAULT_OPTIONS do |t|
  t.string :name, limit: 128, null: false

  t.timestamps null: false
end

add_index :fests, %i[name], name: 'nk_fests', unique: true
