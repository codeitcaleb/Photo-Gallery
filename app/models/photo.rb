class Photo < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :location
  
  validates :image, presence: true
  validates :caption, presence: true
  validates :location, presence: true

  def self.by_location(location_id)
    where(location_id: location_id)
  end

  def self.from_today
    where("created_at >=?", Time.zone.today.beginning_of_day)
  end
end
