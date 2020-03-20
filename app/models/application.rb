class Application < ApplicationRecord
  include ActiveModel::Validations
  
  belongs_to :traveller
  belongs_to :job
  has_many :reviews

  validates :length_of_stay, presence: true
  validates :country_of_origin, presence: true

  has_one_attached :resume
  # validates :resume, attached: true # calls custom validator in app/validators/attached_validator.rb --AS doesn't currently support validations

  def country_name
    country = ISO3166::Country[country_of_origin]
    country.translations[I18n.locale.to_s] || country.name
  end
end
