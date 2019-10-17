class CreateDragqueens < ActiveRecord::Migration[6.0]
  def change
    create_table :dragqueens do |t|
      t.string :name
      t.boolean :winner
      t.integer :place
      t.boolean :misscongeniality
      t.integer :season
      t.string :quote
      t.string :image

      t.timestamps
    end
  end
end
