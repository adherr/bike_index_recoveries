class Bike < ActiveRecord::Base
  validates :bi_id, presence: true
  validates :bi_url, presence: true
  validates :bi_api_url, presence: true
  validates :stolen_record_id, presence: true, uniqueness: true

  # geocoded_by :stolen_location
  # after_validation :geocode
  reverse_geocoded_by :latitude, :longitude do |bike,results|
    if geo = results.first
      bike.stolen_location    = "#{geo.city}, #{geo.state_code}"
    end
  end
  after_validation :reverse_geocode

  default_scope { order('has_story NULLS LAST, date_recovered DESC') }
end
