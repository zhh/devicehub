class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.column :name, :string      
      t.column :description, :string
      t.column :project_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :areas
  end
end
