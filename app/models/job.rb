class Job < ApplicationRecord
  belongs_to :venue
  has_many :applications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :travellers, through: :applications
end
