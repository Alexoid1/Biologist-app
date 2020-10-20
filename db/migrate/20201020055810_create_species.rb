class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :specie
      t.text :content
      t.string :image
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
