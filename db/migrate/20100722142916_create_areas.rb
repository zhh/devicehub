class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :name
      t.string :description
      t.integer :tag, :default => 1
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :areas
  end
end
