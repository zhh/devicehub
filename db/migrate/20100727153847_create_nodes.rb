class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :area_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :nodes
  end
end
