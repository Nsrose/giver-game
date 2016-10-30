Then(/^the following charities exist:$/)  do |charities_table|
  charities_table.hashes.each do |charity|
    # each returned element will be a hash whose key is the table header.
    Charity.create!(charity)
  end
end

When(/^I follow "([^"]*)" from the admin dropdown menu in the navbar$/) do |option|
  within('ul.dropdown-menu#dropdown_admin', visible: false) do
    click_link option
  end
end