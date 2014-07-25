FactoryGirl.define do

  factory :bike do
    sequence(:bi_id)
    sequence(:bi_url) { |n| "https://bikeindex.org/bikes/#{n}" }
    sequence(:bi_api_url) { |n| "https://bikeindex.org/api/v1/bikes/#{n}" }
    sequence(:stolen_record_id)
  end

  factory :bike_stolen_test, class: Bike do
    bi_id 3414
    bi_url "https://bikeindex.org/bikes/3414"
    bi_api_url "https://bikeindex.org/api/v1/bikes/3414"
    year 2014
    manufacturer "Jamis"
    model "Allegro Comp Disc"
    serial "stolen_serial_number"
    color "Blue"
    description "Triple-butted 6061 aluminum with hydro-formed top and down tube, taper gauge \"S\" bend stays, replaceable derailleur hanger, disc brake mounts, eyeleted dropouts and seatstay rack mounts"
    thumb "https://bikebook.s3.amazonaws.com/uploads/Fr/9979/small_14_allegrocompdisc_bk.jpg"
    stolen_record_id 1
    date_stolen Date.parse("2014-05-20T01:00:00-05:00")
    stolen_location "Chicago, IL"
    latitude 41.87810
    longitude (-87.62980)
    date_recovered Date.parse("2014-01-29T11:05:17-06:00")
    recovery_story nil
    tweet_text nil
  end

  factory :bike_stolen_test_story, class: Bike do
    bi_id 3414
    bi_url "https://bikeindex.org/bikes/3414"
    bi_api_url "https://bikeindex.org/api/v1/bikes/3414"
    year 2014
    manufacturer "Jamis"
    model "Allegro Comp Disc"
    serial "stolen_serial_number"
    color "Blue"
    description "Triple-butted 6061 aluminum with hydro-formed top and down tube, taper gauge \"S\" bend stays, replaceable derailleur hanger, disc brake mounts, eyeleted dropouts and seatstay rack mounts"
    thumb "https://bikebook.s3.amazonaws.com/uploads/Fr/9979/small_14_allegrocompdisc_bk.jpg"
    stolen_record_id 1
    date_stolen Date.parse("2014-05-20T01:00:00-05:00")
    stolen_location "Chicago, IL"
    latitude 41.87810
    longitude (-87.62980)
    date_recovered Date.parse("2014-01-29T11:05:17-06:00")
    recovery_story "I Got this bike back because the bike index is awesome! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"
    tweet_text "I Got this bike back because the bike index is awesome!"
  end
end
