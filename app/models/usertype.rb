class Usertype < ActiveRecord::Base
  validates_presence_of :usertype
  validates_uniqueness_of :usertype
end
