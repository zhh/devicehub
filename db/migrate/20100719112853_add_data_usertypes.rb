class AddDataUsertypes < ActiveRecord::Migration
  def self.up
    Usertype.create(:usertype => '管理员')
    Usertype.create(:usertype => '用户')
  end

  def self.down
    Usertype.delete_all
  end
end
