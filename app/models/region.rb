class Region < ApplicationRecord
  has_many :venues

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

end
