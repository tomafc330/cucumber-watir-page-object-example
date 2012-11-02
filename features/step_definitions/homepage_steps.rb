Given /^I click to the Home Page$/ do
  visit_page HomePage
end

When /^I click the Register Link$/ do
  @current_page.register
  @current_page.register_element.wait_while_present
end

Then /^I should be taken to the registration page$/ do
  @current_page.text().should include("Create a free account")
end

Given /^I am on the Registration Page$/ do
  visit_page RegistrationPage
end


When /^I fill in the values using a random profile$/ do
  @random_pass = @current_page.random_string
  @random_email = "#{@current_page.random_string()}@bitly.com"
  @random_username = @current_page.random_string

  @current_page.email = @random_email
  @current_page.password = @random_pass
  @current_page.confirmPassword = @random_pass
  @current_page.username = @random_username
end

And /^I click submit$/ do
  @current_page.reg_form_element.submit
end

Then /^I should see the success page$/ do
  @current_page.reg_form_element.wait_while_present
  @current_page.text().should include('ahoy')
end

When /^I fill in the values using a default profile$/ do
  DataMagic.load 'test_data.yml' #note we are using data magic to populate the fields.
  @current_page.populate_page_with(@current_page.data_for :default_user)
end
Then /^I should see the error on password field with text "([^"]*)"$/ do |arg|
  error_messages = @current_page.get_error_messages()
  error_messages.should have(1).things
  error_messages[0].should == arg
end