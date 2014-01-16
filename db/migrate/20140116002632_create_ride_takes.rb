class CreateRideTakes < ActiveRecord::Migration
  def change
    create_table :ride_takes do |t|
      t.integer :ride_offer_id
      t.integer :user_id
      
      t.timestamps
    end
    add_index :ride_takes, :ride_offer_id
  end
end
