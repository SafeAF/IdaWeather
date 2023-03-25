class AddCoordsToGraph < ActiveRecord::Migration[7.0]
  def change
    add_column :graphs, :coords, :text
  end
end
