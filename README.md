**************
# Note: This gem is for API v1, which has been deprecated, and does not include many of the new API calls. 

# For V2 documentation, please refer to: https://onboardiq.com/docs/apiv2/ 
*************


=====================

# OnboardIQ API

This is a Ruby wrapper to quickly use OnboardIQ's API V1: https://onboardiq.readme.io/v1.0.


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
    ONBOARDIQ  = OnboardIQ.new(token: "123l4cva_mdlkVamk31") #account api token from OnboardIQ
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
  ONBOARDIQ.create_applicant(name: "Dwight Schrute", email: "dwight@dundermifflin.com", phone_number: "1112223333")

  # optional info
  ONBOARDIQ.create_applicant(name: "Dwight Schrute", email: "dwight@dundermifflin.com", phone_number: "1112223333", any: "other", keys: "you want", address[street]: "123 main st", address[city]: "San Francisco, CA")
  ```

**Update Applicant**
  

  ```Ruby
  ONBOARDIQ.update_applicant(applicant_key, attributes)

  # example
  ONBOARDIQ.update_applicant("deb3648f", availability: "monday, tuesday", location: "SF")  
  ```

**List Applicants**
  
  ```Ruby
  ONBOARDIQ.list_applicants
  ```

**Get Applicant**

  ```Ruby
  ONBOARDIQ.get_applicant(applicant_key)

  # example
  ONBOARDIQ.get_applicant("deb3648f")  
  ```
