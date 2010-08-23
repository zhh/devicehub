class Device < ActiveRecord::Base
  belongs_to :area
  belongs_to :node
  belongs_to :user

  def self.find_all_project_devices(project)
    self.find_all_by_node_id(Area.find_all_by_project_id(project))
  end
end
