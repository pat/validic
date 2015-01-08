# Validic #

## Build Status
[![Codeship Status for Validic/validic](https://www.codeship.io/projects/cc4ff330-9f72-0130-3cf3-0e5a3e2104f7/status?branch=master)](https://www.codeship.io/projects/3456)

## Stable Version: 1.0.0

Ruby API Wrapper for [Validic](http://www.validic.com). It includes the
following functionality:

## Breaking Changes ##
- Methods for user provisioning, suspending, and deleting have been renamed
- Methods will now default to initialized values unless overridden in options

### Organization ###
- Organization metadata

### Users ###
- Provision new Validic users
- Update, Suspend, or Delete users
- Get users from organization credentials
- Find user id from authentication token
- Refresh user authentication token

### Profiles ###
- Get profile information from user authentication token
- Create and modify user profiles

### Apps ###
- List available third party apps
- List synced apps for a particular user

### Activities ###
- Fitness, Routine, Nutrition, Sleep, Weight, Diabetes, Biometrics, Tobacco
  Cessation
- Get activities scoped to user or organization
- Activities from specific sources
- Specified time ranges

### Connect ###
- Create activities as a Validic Connect partner
- Post extra data

### Latest Endpoint ###
- Get latest data recorded, regardless of when the activity occurred
- Scope to organization or user level
- Specify start and end points

## Installation
Add this line to your application's Gemfile:

    gem 'validic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validic

## Usage

##### Rails 3+
First, instantiate the client.
```ruby
require 'validic'

# config/initializers/validic.rb
Validic.configure do |config|
  config.api_url          = 'https://api.validic.com'
  config.api_version      = 'v1'
  config.access_token     = 'ORGANIZATION_ACCESS_TOKEN',
  config.organization_id  = 'ORGANIZATION_ID'
end

# Create a Client Object provided you have an initializer
client = Validic::Client.new
```

##### Plain ruby
```ruby

options = {
  api_url:         'https://api.validic.com',
  api_version:     'v1',
  access_token:    'ORGANIZATION_ACCESS_TOKEN',
  organization_id: 'ORGANIZATION_ID'
}
client = Validic::Client.new options
```

Now you can use the wrapper's helper methods to interface with the Validic API.
```ruby
# Get current organization metadata
client.get_organization
```

The wrapper returns the JSON response as a [Hashie::Mash](https://github.com/intridea/hashie#mash) instance for easy
manipulation.
```ruby
# Get an array of apps for my current organization
client.get_apps.apps.map(&:name)
```

You can pass a hash of options to calls that fetch data.
```ruby
client.get_routine(start_date: '2015-01-01T00:00:00+00:00')
```

### More Examples ###

You can override initialized organization id and access tokens for all helper
methods by passing parameters in an options hash as a final parameter.

Below are examples of all helper methods.

```ruby
require 'validic'

# Alternatively you can use an initializer
options = {
  api_url:         'https://api.validic.com',
  api_version:     'v1',
  access_token:    'ORGANIZATION_ACCESS_TOKEN',
  organization_id: 'ORGANIZATION_ID'
}
client = Validic::Client.new options
```

## Organization methods

##### Get current organization
```ruby
client.get_organization
```

##   User methods

##### Get users from organization credentials
```ruby
client.get_users
```

##### Get user id from authentication token
```ruby
client.me('USER_AUTHENTICATION_TOKEN')
```

##### Provision new users
```ruby
client.provision_user('UNIQUE_USER_ID')
```

##### Updating a user
```ruby
client.update_user('VALIDIC_USER_ID', options)
```

##### Suspend a user
```ruby
client.suspend_user('VALIDIC_USER_ID')
```

##### Unsuspend a user
```ruby
client.unsuspend_user('VALIDIC_USER_ID')
```

##### Refresh authentication token
```ruby
client.refresh_token('VALIDIC_USER_ID')
```

##### Delete a user
```ruby
client.delete_user('VALIDIC_USER_ID')
```

##   Profile methods

##### Get a user profile
```ruby
client.get_profile('USER_AUTHENTICATION_TOKEN')
```

##### Create a user profile
```ruby
client.create_profile('USER_AUTHENTICATION_TOKEN', options)
```

##   Apps methods

##### Get a list of available third-party-apps
```ruby
client.get_apps
```

##### Get a list of apps a user is synced to
```ruby
client.get_synced_apps('USER_AUTHENTICATION_TOKEN')
```

##   Activity methods

###### You can also filter the results of the following methods by passing an options hash

##### Get an array of fitness records
```ruby
client.get_fitness
```

##### Get an array of routine records
```ruby
client.get_routine
```

##### Get an array of nutrition records
```ruby
client.get_nutritions
```

##### Get an array of weight records
```ruby
client.get_weight
```

##### Get an array of diabetes records
```ruby
client.get_diabetes
```

##### Get an array of biometrics records
```ruby
client.get_biometrics
```

##### Get an array of sleep records
```ruby
client.get_sleep
```

##### Get an array of tobacco cessation records
```ruby
client.get_tobacco_cessations
```

##Validic Connect

##### Fitness
```ruby
client.create_fitness('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID', options)
client.update_fitness('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_fitness('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Routine
```ruby
client.create_routine('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID', options)
client.update_routine('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_routine('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Nutrition
```ruby
client.create_nutrition('VALIDIC_USER_ID', 'UNIQUE_ENTRY_ID', options)
client.update_nutrition('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_nutrition('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Weight
```ruby
client.create_weight('VALIDIC_USER_ID', 'UNIQUE_DATA_ID', options)
client.update_weight('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_weight('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Diabetes
```ruby
client.create_diabetes('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID', options)
client.update_diabetes('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_diabetes('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Biometrics
```ruby
client.create_biometric('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID', options)
client.update_biometric('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_biometric('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Sleep
```ruby
client.create_sleep('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID', options)
client.update_sleep('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_sleep('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### Tobacco Cessation
```ruby
client.create_tobacco_cessation('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID' options)
client.update_tobacco_cessation('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID', options)
client.delete_tobacco_cessation('VALIDIC_USER_ID', 'VALIDIC_ACTIVITY_ID')
```

##### You can also create data with your own custom extras as JSON
```ruby
client.create_fitness('VALIDIC_USER_ID', 'UNIQUE_ACTIVITY_ID', extras: "{\"stars\": 3}")
```

##   Latest Records

###### You can also pass an options hash to filter latest results

##### Pull latest records for specified type
```ruby
client.latest('routine')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
