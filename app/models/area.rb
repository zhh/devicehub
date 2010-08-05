class Area < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :nodes

  validates_presence_of :name, :description
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255

  #查询所有区域
  def self.find_all_areas
    find(:all, :order => 'created_at desc')
  end

  #查询指定项目的区域
  def self.find_all_project_areas(project)
    find_all_by_project_id(project)
  end

  #获取一个项目的区域并生成一个数组
  def self.project_areas_to_array(project)
    pas = find_all_project_areas(project)
    areas = []
    pas.each do |pa|
      areas << [pa.name, pa.id]
    end
    areas
  end

  #删除区域前检查该区域的节点是否为空
  def before_destroy
    raise _("area_destroy_fail_for_nodes") unless self.nodes.empty?
  end
end
