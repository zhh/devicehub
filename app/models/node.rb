class Node < ActiveRecord::Base
  belongs_to :area
  belongs_to :user

  validates_presence_of :name, :description, :area_id
  validates_inclusion_of :area_id, :in => Area.all.map(&:id)
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255

  def self.find_all_project_nodes(project)
    find_all_by_area_id(project.areas)
  end
end
