class RemoveDatesFromAddresses < ActiveRecord::Migration[5.0]
  def change
  	remove_column :addresses, :updated_at
  	remove_column :addresses, :created_at
  end
end
