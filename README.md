## Winton DeShong: Portfolio 2015
This is a boilerplate Ruby on Rails application configured with best practices in dependencies, performance and various other areas.

### Development
---
#### Running and contributing to the project
- ```bin/bundle install```
- ```bin/rake db:migrate```
- ```bin/rake db:test:prepare```
- ```bin/foreman start```
- ```bin/guard```

#### Project Setup
- Devise Authentication ```config/devise.rb```
    - Change ```config.mailer_sender = '<email>'```
- Environments
    - Production ```config/environments/production.rb```
        - Configure Action Mailer settings (ie. asset_host)
- RVM
    - Change project name in ```.rvmrc```

#### System Setup
- ```cp config/database.yml.sample config/database.yml```
- ```cp .env.sample .env```

### Architecture
---
#### Authentication
- Devise

#### Client-side Javascript
- CoffeeScript for JavaScript Abstraction

#### Database
- PostgreSQL for all environments

#### Models
- Annotate: With the deprecation of attr_accessible, there is not a clear picture of attributes on your models.
  Calling ```annotate``` will put schema information on top of your model files. Annotate will automatically be
  executed when you run ```rake db:migrate```.

#### Testing
- Tests are written with RSpec in spec/ folder
    - Manual:
        - Full suite: ```bin/rake spec```
        - Development-only Tests: ```bin/rake spec:development```
            - Excludes 'Features', 'Requests' and 'Integration'
    - Automatic with Spork (recommended): ```bin/guard```
        - Full suite: Set ```EXCLUDE_INTEGRATION_TESTS``` in .env to ```false```
        - Development-only Tests: Set ```EXCLUDE_INTEGRATION_TESTS``` in .env to ```true```
- Factories via Factory Girl in spec/factories
- Types
    - Controllers
    - Features (via Capybara)
    - Helpers
    - Models
    - Routes
    - Views
- Logs
    - Run ```tail -f log/test.log``` for more details

#### Views
- Haml for HTML Abstraction
    - Rake task generate only ERB? Run ```rake haml:replace_erbs``` to convert them.
- Sass for CSS Abstraction

#### Webserver
- Unicorn for concurrency

### Debugging
---
- For easier debugging commands in pry, simply create ~/.pryrc with the following lines...

    ```
    if defined?(PryByebug)
      Pry.commands.alias_command 'c', 'continue'
      Pry.commands.alias_command 's', 'step'
      Pry.commands.alias_command 'n', 'next'
      Pry.commands.alias_command 'f', 'finish'
    end
    ```

### Troubleshooting
---
#### Could not find bcrypt though bundler installed correctly
- Need to locate spring server ```ps aux | grep spring```
- Kill the process ```kill 12345```

#### Factory Girl complaining attribute doesn't exist?
- Problem:

    ```
    Failure/Error: @user = FactoryGirl.build(:user)
     NoMethodError:
       undefined method `first_name=' for #<User:0x007fd22962e8c0>
    ```

- Solution: ```bin/rake db:test:load```
