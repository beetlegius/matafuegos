class CreateSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.float :latitude, :longitude

      t.timestamps
    end
  end
end
