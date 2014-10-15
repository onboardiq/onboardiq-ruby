# OnboardIQ API

This is a Ruby wrapper to quickly use OnboardIQ's API.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'onboardiq'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onboardiq

## Usage

**Configure authentication keys**
  Create a new file in config/initializers/onboardiq.rb
  ```Ruby
  OnboardIQ.configure do |c|
    c.token   = "123l4cva_mdlkVamk31" #account api token from OnboardIQ
  end
  ```

**Create Applicant**
  Required attributes: [name, email, phone_number] 
  Email must be valid and unique 
  Phone_number must be unique 
  'Key' is reserved for our identifier 
  All keys at the root level.
  You can pass in any additional keys you would like (availability, location, vehicle, address, phone, etc.)

  ```Ruby
  # minimum
  OnboardIQ.create_applicant(name: "Dwight Schrute", email: "dwight@dundermifflin.com", phone_number: "1112223333")

  # optional info
  OnboardIQ.create_applicant(name: "Dwight Schrute", email: "dwight@dundermifflin.com", phone_number: "1112223333", any: "other", keys: "you want", address[street]: '123 main st', address[city]: 'San Francisco, CA')

  ```
**List Applicants**
  
  ```Ruby
  OnboardIQ.list_applicants

  ```


**Update Applicant**
  Very similar to Create 

  ```Ruby
  applicant_key = "deb3648f"
  OnboardIQ.update_applicant("deb3648f", availability: "monday, tuesday")  
  ```
  
**Get Applicant**

  ```Ruby
  OnboardIQ.get_applicant("deb3648f")
  
  ```