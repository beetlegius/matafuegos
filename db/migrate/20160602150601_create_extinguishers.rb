class CreateExtinguishers < ActiveRecord::Migration[5.0]
  def change
    create_table :extinguishers do |t|
      t.string :kind
      t.date :expiration_at

      t.belongs_to :sector, foreign_key: true, index: true
      t.timestamps
    end
  end
end
