class Area < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :nodes

  validates_presence_of :name, :description
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255

  # 查询所有项目
  def self.find_all_areas
    find(:all, :order => 'created_at desc')
  end

  def self.find_all_project_areas(project)
    find_all_by_project_id(project)
  end

  def before_destroy
    raise _("area_destroy_fail_for_nodes") unless self.nodes.empty?
  end
end
