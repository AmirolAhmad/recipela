class User < ActiveRecord::Base
  # Avatar uploader using carrierwave
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  scope :admin, -> { where(admin: true) }

  

  # Overridden to notify users with password changes
  def update_with_password(params, *options)
    if super
      # TODO schedule this in the background
      UserMailer.password_changed(self.id).deliver
    end
  end
end
