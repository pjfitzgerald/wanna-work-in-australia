class Traveller < User
  has_many :applications, dependent: :destroy
  has_many :jobs, through: :applications

  # active_storage + amazon s3 
  has_one_attached :resume
end
