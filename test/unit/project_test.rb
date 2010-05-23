require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :projects

  def valid_project
    { :name => "电信实业大厦项目", :description => '自建项目' }
  end

  def test_invalid_with_empty_attributes
    project = Project.new
    assert !project.valid?
    assert project.errors.invalid?(:name)
    assert project.errors.invalid?(:description)
  end
  
  def test_unique_name
    project = Project.new(:name => projects(:project_001).name, :description => "测试项目名称不重复" )
    assert !project.save
  end
end
