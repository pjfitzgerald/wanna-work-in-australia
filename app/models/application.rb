class Application < ApplicationRecord
  belongs_to :traveller
  belongs_to :job
  has_many :reviews

  has_one_attached :resume # test attachment to each application individually

  validates :length_of_stay, presence: true
  validates :country_of_origin, presence: true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
