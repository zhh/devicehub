class CreateDevicetypes < ActiveRecord::Migration
  def self.up
    create_table :devicetypes do |t|
      t.column :name, :string
      t.column :description, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :devicetypes
  end
end
