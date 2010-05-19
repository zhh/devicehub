class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description

  # 查询所有项目
  def self.find_projects
    find(:all)
  end
end
