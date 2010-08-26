class Project < ActiveRecord::Base
  has_many :areas  

  validates_presence_of :name, :description
  validates_uniqueness_of :name
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255

  # 查询所有项目
  def self.find_all_projects(order)
    find(:all, :order => order)
  end

  def self.projects_to_array
    ps = find(:all)
    projects = []
    ps.each do |p|
      projects << [p.name, p.id]
    end
    projects
  end

  def before_destroy
    raise _("project_destroy_fail_for_areas") unless self.areas.empty?
  end
end
