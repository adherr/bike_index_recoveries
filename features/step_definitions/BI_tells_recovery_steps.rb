Given(/^that a bike on the index has been recovered$/) do

end

When(/^the Bike Index tells the recovery app about the recovery$/) do
puts WebMock::StubRegistry.instance.request_stubs
  post_params = {key: ENV['INCOMING_REQUEST_KEY'], api_url: "https://bikeindex.org/api/v1/bikes/3414", theft_information: {date_stolen: "2014-05-20T01:00:00-05:00", location: "Chicago, IL"}, recovery_information: {date_recovered: "2014-01-29T11:05:17-06:00", recovery_story: nil}}
  post 'api/v1/recoveries', post_params, format: :json
  expect(response.code).to eq("200")
end

Then(/^that bike should show up on the recoveries app/) do
  visit(root)
  expect(page).to have_content('2014 Allegro Comp Disc')
end
