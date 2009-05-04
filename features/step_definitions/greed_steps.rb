Then /^I am asked to choose players$/ do
  response.should contain("Select Your Opponent")
end

Given /^a fresh start$/ do
  visit "/simulate/clear"
end

Given /^the dice will roll ([1-6,]+)$/ do |faces|
  f = faces.split(",").map { |n| n.to_i }.join("-")
  visit "/simulate/#{f}"
end

Given /^I take a turn$/ do
  click_link("Start Your Turn")
end

Given /^I start a game$/ do 
  $roller = nil
  visit path_to("the homepage")
  fill_in("game_name", :with => "John") 
  click_button("Next")
  choose("Connie")
  click_button("Play")
end

Given /^I look at the total score for (\w+)$/ do |player|
  doc = Nokogiri::HTML(response.body)
  n = doc.css("span.score")
  @saved_total_points = n.first.text
end

When /^I refresh the screen$/ do
  visit request.path
end

Then /^the total score for Connie is unchanged$/ do
  doc = Nokogiri::HTML(response.body)
  n = doc.css("span.score")
  assert_equal @saved_total_points, n.first.text
end

Then /^the turn score so far is (\d+)$/ do |score|
  assert_contain "so far: #{score}"
end

When /^I choose to hold$/ do
  click_link "Hold"
end

When /^I continue$/ do
  click_link "Continue"
end

Then /^(\w+)'s game score is (\d+)$/ do |player, score| # '
  doc = Nokogiri::HTML(response.body)
  n = doc.css("div#sidebar")
  assert_match(/#{player}\s+#{score}/, n.text)
end

Then /^it is my turn$/ do
  assert_contain "Your Turn"
end

Then /^it is (\w+)'s turn$/ do |player| # '
  assert_contain "#{player}'s Turn"
end

Then /^(\w+) go(es)? bust$/ do |player, _|
  player = "John" if player == "I"
  assert_match(/#{player}\s+went bust/mi, css("p.action").text)
end

When /^I choose to roll again$/ do
  click_link "Roll Again"
end

Then /^(\d+) dice are displayed$/ do |dice_count|
  ul = css("ul.dice")
  li = ul.last.css("li.die")
  assert_equal dice_count.to_i, li.size
end

Then /^(\w+) wins the game$/ do |player|
  assert_contain "The Winner is #{player}"
end

# Helpers ------------------------------------------------------------

def css(pattern)
  doc = Nokogiri::HTML(response.body)
  doc.css(pattern)
end
