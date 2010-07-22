class User < ActiveRecord::Base
  has_many :areas

  validates_presence_of :username, :password, :password_confirmation, :name
  validates_uniqueness_of :username, :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end

  def self.authenticate(name, password)
    user = user.find_by_name(name)
    if user
      if user.hashed_password != self.encrypted_password(password,user.salt)
        user = nil
      end
    end
    user
  end

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password,self.salt)
  end

  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  private
  def self.encrypted_password(password,salt)
    string_to_hash = password + "abc" + salt
    Digest::SHA2.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
