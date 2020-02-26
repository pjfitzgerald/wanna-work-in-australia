class Application < ApplicationRecord
  belongs_to :traveller
  belongs_to :job
  has_many :reviews

  has_one_attached :resume # test attachment to each application individually
end
