When(/^they go to the recoveries site$/) do
  visit(root_path)
end

Then(/^they see a list of recovered bikes$/) do
  visit(root_path)
  expect(page).to have_content('Here are the recoveries')
end
