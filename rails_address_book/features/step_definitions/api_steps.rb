Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When /^I send a GET require to "([^"]*)"$/ do |path|
  get path 
end

When /^I send a POST request to "([^\"]*)" with the following:$/ do |path, body|
  post path, body
end

Then /^the response status should be "([^"]*)"$/ do |status|
  last_response.status.should eq(status.to_i), "response status code did not match: expected #{status} was #{last_response.status}\n#{last_response.body}"
end

Then /^the response body should be a JSON representation of the (\w+)$/ do |model|
  last_response.body.should eq(model.constantize.last.to_json)
end

Then /^the response body should be a JSON representation of the (\w+) list$/ do |model|
  last_response.body.should eq(model.constantize.all.to_json)
end