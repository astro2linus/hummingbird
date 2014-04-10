Then(/^I should see the "(.*?)"$/) do |msg|
  should have_text msg
end

Then(/^I should see the message "(.*?)"$/) do |msg|
  should have_text msg
end

# Successful registration

Given(/^I register an account with valid informaiton$/) do
  ts = Time.now.to_i.to_s
	email = "test#{ts}@intridea.com"
	uname = (0...9).map { ('a'..'z').to_a[rand(26)] }.join
  args = {:user_name => uname, :first_name => "Koala #{ts}", :last_name => "Bear_#{ts}",
  	:password => "Abc1234", :password_confirmation => "Abc1234",
  	:email => email
  }
  register(args)
end

# Password validation

Given(/^I register an account with password "(.*?)"$/) do |pwd|
	ts = Time.now.to_i.to_s
	email = "test#{ts}@test.com"
	uname = (0...9).map { ('a'..'z').to_a[rand(26)] }.join
  args = {:user_name => uname, :first_name => "Koala", :last_name => "Bear",
  	:password => pwd, :password_confirmation => pwd,
  	:email => email
  }
  register(args)
end

# Email validation 

Given(/^I register an account with email "(.*?)"$/) do |email|
	uname = (0...9).map { ('a'..'z').to_a[rand(26)] }.join
  args = {:user_name => uname, :first_name => "Koala", :last_name => "Bear",
  	:password => "Abc1234", :password_confirmation => "Abc1234",
  	:email => email
  }
  register(args)
end

# Required field validation

Given(/^I register an account without "(.*?)"$/) do |field|
	ts = Time.now.to_i.to_s
	email = "test#{ts}@test.com"
	uname = (0...9).map { ('a'..'z').to_a[rand(26)] }.join
  args = {:user_name => uname, :first_name => "Koala", :last_name => "Bear",
  	:password => "Abc1234", :password_confirmation => "Abc1234",
  	:email => email
  }
  args[field.to_sym] = ""
  register(args)
end

# Email has been taben"

Given(/^I register and account using an existing email address$/) do
  ts = Time.now.to_i.to_s
	email = "linus@intridea.com" # make sure this email has been registered
	uname = (0...9).map { ('a'..'z').to_a[rand(26)] }.join
  args = {:user_name => uname, :first_name => "Koala_#{ts}", :last_name => "Bear_#{ts}",
  	:password => "Abc1234", :password_confirmation => "Abc1234",
  	:email => email
  }
  register(args)
end

And(/^I log out$/) do
	click_on "Logout"
end

