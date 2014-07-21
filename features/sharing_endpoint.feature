Feature: It should have an endpoint for sharing
In order to publicize recoveries that BI users say they would like to share
The Bike Index will ask the recoveries app to share on social media. The recovery app
Should make this happen

Scenario: The bike index creates a recovery with a story and a tweet
When The bike index POSTs a recovery that has a story and a tweet
Then we post about that bike to facebook and twitter
