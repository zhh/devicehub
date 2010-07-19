class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :username, :string
      t.column :hashed_password, :string
      t.column :salt, :string
      t.column :name, :string
      t.column :email, :string
      t.column :phone, :string
      t.column :usertype_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
