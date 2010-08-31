class Node < ActiveRecord::Base
  belongs_to :area
  belongs_to :user
  has_many :devices

  validates_presence_of :name, :description, :area_id  
  validates_uniqueness_of :name
  #validates_inclusion_of :area_id, :in => Area.all.map{ |a| a.id }
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255

  def self.find_all_nodes_for_project(project)
    find_all_by_area_id(project.areas)
  end

  def self.find_all_nodes_for_area(area)
    find_all_by_area_id(area)
  end

  #获取一个区域的节点并生成一个数组
  def self.area_nodes_to_array(area)
    pas = find_all_nodes_for_area(area)
    nodes = []
    pas.each do |pa|
      nodes << [pa.name, pa.id]
    end
    if nodes.empty?
      nodes = [['无',0]]
    else
      nodes
    end
  end
end
