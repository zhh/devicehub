class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string :name
      t.string :description
      t.integer :node_id
      t.integer :area_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
