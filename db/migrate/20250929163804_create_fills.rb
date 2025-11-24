class CreateFills < ActiveRecord::Migration[8.0]
  def change
    create_table :fills do |t|
      t.string :name
      t.integer :stop
      t.integer :alpha
      t.belongs_to :swatch
      t.belongs_to :color
      t.belongs_to :user

      t.timestamps
    end
  end
end
