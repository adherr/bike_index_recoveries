Feature: Accept new recoveries
In order to display recoveries from the Bike Index
The recoveries app
Should learn about new bike recoveries via its API

Scenario: A user on the Bike Index notes that a stolen bike has been recovered
Given that a bike on the index has been recovered
When the Bike Index tells the recovery app about the recovery
Then that bike should show up on the recoveries app with all of the associated data

Scenario: Someone tries to spoof the BI and send spurious recoveries to the app
Given that they don't have the appropriate key
When they make a POST request to the API with the wrong key
Then they will recieve a 401 Unauthorized
And that bike should not show up on the recoveries site
