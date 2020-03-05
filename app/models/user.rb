class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  #skip devise::confirmable in development
  after_create :skip_confirm

  has_one_attached :profile_image
  
  private

  def skip_confirm
    self.confirm if Rails.env.development?
  end

end
