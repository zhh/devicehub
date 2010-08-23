class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :node_id, :integer
      t.column :area_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
