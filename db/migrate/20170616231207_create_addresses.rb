class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.float :elevation

      t.timestamps
    end
  end
end
