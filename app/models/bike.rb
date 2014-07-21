class Bike < ActiveRecord::Base
  validates :bi_id, presence: true
  validates :bi_url, presence: true
  validates :bi_api_url, presence: true
  validates :stolen_record_id, presence: true, uniqueness: true

  geocoded_by :stolen_location
  after_validation :geocode
end
