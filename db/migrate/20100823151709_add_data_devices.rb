class AddDataDevices < ActiveRecord::Migration
  def self.up
    Device.create(
      :name => 'Droid手机',
      :description => '好哇',
      :node_id => 35,
      :area_id => 19,
      :user_id => 1
    )
    Device.create(
      :name => 'Google Hero手机',
      :description => '好哇',
      :area_id => 19,
      :user_id => 1
    )
  end

  def self.down
  end
end
