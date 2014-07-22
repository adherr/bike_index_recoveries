When(/^The bike index POSTs a recovery that has a story and a tweet$/) do
  VCR.use_cassette('bikeindex', record: :none) do
    post_params = {key: ENV['INCOMING_REQUEST_KEY'], api_url: "https://bikeindex.org/api/v1/bikes/3414", theft_information: {stolen_record_id: 1, date_stolen: "2014-05-20T01:00:00-05:00", location: "Chicago, IL"}, recovery_information: {date_recovered: "2014-01-29T11:05:17-06:00", recovery_story: "I Got this bike back because the bike index is awesome! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non", tweet: "I Got this bike back because the bike index is awesome!"}}
    response = post 'api/v1/recoveries', post_params, format: :json
    expect(response.status).to eq(200)
  end
end

Then(/^we post about that bike to facebook and twitter$/) do
  pending # express the regexp above with the code you wish you had
end
