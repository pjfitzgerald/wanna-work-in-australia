class Venue < ApplicationRecord
  belongs_to :venue_admin, optional: true # allow venues to exist without an admin
  belongs_to :region
  has_many :jobs, dependent: :destroy
  has_many :applications, through: :jobs
  validates :name, presence: true


  # below methods are required for importing Venues with potentially new regions
  # see seeds.rb import_venues for where it is used
  # https://stackoverflow.com/questions/42494410/importing-csv-data-into-rails-app-using-something-other-then-the-association-i/42494714#42494714

  def region_name
    region.try(:name)
  end

  def region_name=(name)
    self.region = Region.where(name: name).first_or_create
  end

end

