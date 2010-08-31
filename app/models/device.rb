class Device < ActiveRecord::Base
  belongs_to :area
  belongs_to :node
  belongs_to :user

  validates_presence_of :name, :description, :area_id
  validates_uniqueness_of :name
  #validates_inclusion_of :area_id, :in => Area.all.map{ |a| a.id }
  #validates_inclusion_of :node_id, :in => Node.all.map{ |a| a.id } + [0]
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255

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
