Given(/^that a bike on the index has been recovered$/) do

end

When(/^the Bike Index tells the recovery app about the recovery$/) do
  VCR.use_cassette('cucumber', record: :none) do
    post_params = {key: ENV['INCOMING_REQUEST_KEY'], api_url: "https://bikeindex.org/api/v1/bikes/3414", theft_information: {stolen_record_id: 1, date_stolen: "2014-05-20T01:00:00-05:00", location: "Chicago, IL"}, recovery_information: {date_recovered: "2014-01-29T11:05:17-06:00", recovery_story: nil, tweet: nil}}
    response = post 'api/v1/recoveries', post_params, format: :json
    expect(response.status).to eq(200)
  end
end

Then(/^that bike should show up on the recoveries app/) do
  visit(root_url)
  expect(page).to have_content('2014 Jamis Allegro Comp Disc')
end

Given(/^that they don't have the appropriate key$/) do

end

When(/^they make a POST request to the API with the wrong key$/) do
  VCR.use_cassette('cucumber', record: :none) do
    post_params = {key: "the wrong key", api_url: "https://bikeindex.org/api/v1/bikes/3415", theft_information: {date_stolen: "2012-12-20T01:00:00-05:00", location: "Strasburg, PA"}, recovery_information: {date_recovered: "2014-03-29T11:05:17-06:00", recovery_story: "it was awesome, I kicked his ass"}}
    response = post 'api/v1/recoveries', post_params, format: :json
  end
end

Then(/^they will recieve a (\d+) Unauthorized$/) do |code|
  VCR.use_cassette('cucumber', record: :none) do
    post_params = {key: "the wrong key", api_url: "https://bikeindex.org/api/v1/bikes/3415", theft_information: {date_stolen: "2012-12-20T01:00:00-05:00", location: "Strasburg, PA"}, recovery_information: {date_recovered: "2014-03-29T11:05:17-06:00", recovery_story: "it was awesome, I kicked his ass"}}
    response = post 'api/v1/recoveries', post_params, format: :json
    expect(response.status).to eq(code.to_i)
  end
end

Then(/^that bike should not show up on the recoveries site$/) do
  visit(root_url)
  expect(page).not_to have_content('Americano')
end
