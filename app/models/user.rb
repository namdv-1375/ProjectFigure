class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable

  validates :username, presence: true, uniqueness: { case_sensitive: true }

  mount_uploader :avatar, AvatarUploader

  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:username])
  end

  before_create :set_default_role

  private
  def set_default_role
    self.role ||= Role.find_by_name("user")
  end
end
