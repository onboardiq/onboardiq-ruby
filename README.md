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

  Required attributes: [name, email, phone_number] <br />
  Email must be valid and unique <br />
  Phone_number must be unique <br />
  'Key' is reserved for our identifier <br />
  All keys at the root level. <br />
  You can pass in any additional keys you would like (availability, location, vehicle, address, phone, etc.) <br />

  ```Ruby
  # minimum
  OnboardIQ.create_applicant(name: "Dwight Schrute", email: "dwight@dundermifflin.com", phone_number: "1112223333")

  # optional info
  OnboardIQ.create_applicant(name: "Dwight Schrute", email: "dwight@dundermifflin.com", phone_number: "1112223333", any: "other", keys: "you want", address[street]: "123 main st", address[city]: "San Francisco, CA")
  ```

**Update Applicant**
  

  ```Ruby
  OnboardIQ.update_applicant(applicant_key, attributes)

  # example
  OnboardIQ.update_applicant("deb3648f", availability: "monday, tuesday", location: "SF")  
  ```

**List Applicants**
  
  ```Ruby
  OnboardIQ.list_applicants
  ```

**Get Applicant**

  ```Ruby
  OnboardIQ.get_applicant(applicant_key)

  # example
  OnboardIQ.get_applicant("deb3648f")  
  ```