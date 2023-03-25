class CreateGraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :graphs do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.integer :start_year, default: 0
      t.integer :end_year, default: 0
      t.integer :year, default: 0
      t.boolean :range, default: false
      t.integer :month, default: 0
      t.integer :day, default: 0
      t.integer :hour, default: 0
      t.string :independent_var, default: ""
      t.string :dependent_var, default: ""
      t.string :chart_type, default: ""
      t.string :category, default: ""
      t.string :location, default: ""
      t.string :lat, default: ""
      t.string :lon, default: ""
      t.string :function, default: ""
      t.references :study, null: false, foreign_key: true

      t.timestamps
    end
  end
end

