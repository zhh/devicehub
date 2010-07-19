class CreateUsertypes < ActiveRecord::Migration
  def self.up
    create_table :usertypes do |t|
      t.column :usertype, :string
      t.column :description, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :usertypes
  end
end
