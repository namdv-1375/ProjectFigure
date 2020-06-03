class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable

  validates :username, uniqueness: { case_sensitive: true }

  mount_uploader :avatar, AvatarUploader

  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:username])
  end
end
