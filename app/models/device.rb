class Device < ActiveRecord::Base
  belongs_to :area
  belongs_to :node
  belongs_to :user

  def self.find_all_devices_for_project(project)
    find_all_by_area_id(project.areas)
  end

  def self.find_all_devices_for_node(node)
    find_all_by_node_id(node)
  end

    def self.find_all_devices_for_area(area)
    find_all_by_area_id(area)
  end
end
