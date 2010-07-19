class AddDataUsers < ActiveRecord::Migration
  def self.up
    User.create(
      :username => 'admin',
      :password => 'admin',
      :password_confirmation => 'admin',
      :name => '管理员',
      :email => 'device@cqcis.com',
      :phone => '18996009999',
      :usertype_id => 1
    )
    User.create(
      :username => 'zhh',
      :password => 'zhh',
      :password_confirmation => 'zhh',
      :name => '赵皓',
      :email => 'zhaohao@cqcis.com',
      :phone => '18996000000',
      :usertype_id => 2
    )
  end

  def self.down
    User.delete_all
  end
end
