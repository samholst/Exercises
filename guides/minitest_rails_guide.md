### Mini Test
There are two main testing gems within rails, Rspec and Minitest. Since Minitest ships with Rails, lets focus on how to use it with rails.




### Installing Minitest

If we are starting from scratch, we can create a new app by ``rails new TestSuite -T``. The -T tells rails not to include any test units upon creating the app. This means that rails will not generate and test or spec files upon generating any scaffolds or models.

We can add minitest to our project by opening ``vim gemfile`` and adding the following code:

```ruby
group :test do
  gem 'minitest'
end
```

This lets us use it in our testing environment. Now run ``bundle install``.

Now let's create a new folder for our test and a new helper config file ``mkdir test && touch minitest_helper.rb``.

Open up the newly created file ``vim minitest_helper.rb``. Paste the following code into it:

```ruby
ENV["RAILS_ENV"] = "test" 	# Forces it to be in test environment
require File.expand_path("../../config/environment", __FILE__) 	# loads the application
require "minitest/autorun"
```




### Creating Model Tests

To create a model test, ``cd test && mkdir models``, then create your model file ``vim user_test.rb`` and add these line at the very top. This will load our configuration we created earlier before running the future test.

```ruby
require "minitest_helper"
```

There are two ways to use minitest: Class Style and Spec Style.

```ruby
# Class Style
class UserTest < MiniTest::Unit::TestCase
  def some_method
    user = User.create!(name: "Hi")
    assert user.valid?
  end
end

# Spec Style
describe User do
  it 'can create a user'
    user = User.create!(name: "Hi")
    assert user.valid?
  end
end
```

If your test database isn't set up already, you'll need to set it up by running ``rails db:test:prepare``.

Now we can run our test by typing ``rails test test/models/user_test.rb``.




### Creating a Rake Task To Run Certain Tests

Create a new rake file and insert the following code ``vim lib/tasks/minitest.rake``:

```ruby
# lib/tasks/minitest.rake

require "rake/testtask"

# Will automatically prepare test database if there are new migrations
# Searches for files ending in _test.rb in the test directory
Rake::TestTask.new(:test => "db:test:prepare") do |t|
  t.libs << "test"
  t.pattern << = "test/**/*_test.rb"
end

# Will use test as defaut task if rake is run by itself
task :default => :test
``` 

### Integration testing with Capybara

Install capybara in your ``gemfile``.

```ruby
group :test do
  gem 'minitest'
  gem 'capybara'
end
```

Insert a special class into the minitest_helper.rb

```ruby
# Add this below minitest/autorun
require "capybara/rails"

class IntegrationTest < MiniTest::Spec
  # Gibes us access to rails path helpers
  include Rails.application.routes.url_helpers

  # Gives us access to visit pages and expect methods
  include Capybara::DSL
  
  # This will use a regex expression to find tests that have
  # (describe 'users integrations' do) and add in this extra
  # functionality
  register_spec_type /integration$/, self
end

```

Create a ``mkdir test/integration && vim users_integration_test.rb``.

```ruby
require "minitest_helper"

describe "Users integration" do
  it "shows the users name" do
    user = User.create!(name: "Hi")

    visit users_path(user)
    page.text.must_include "Hi"
  end
end
```




### Helper Testing

Add the following lines to ``test/minitest_helper.rb``

```ruby
# Add this below capybara/rails
require "active_support/testing/setup_and_teardown"

class HelperTest < MiniTest::Spec
  # This will import all the rails helpers
  include ActiveSupport::Tseting::SetupAndTeardown
  include ActionView::TestCase::Behavior
  register_spec_type(/Helper$/, self)
end
```

Create a new folder and file ``mkdir test/helpers && vim users_helper_test.rb``.

```ruby
require "minitest_helper"

describe UsersHelper do
  it "converts users income" do
    number_to_currency(5000).must_equal "$5.00"
  end
end
```




#### Skipping Tests

You can skip tests one of two ways:

```ruby
  it "converts users income"

  it "converts users income" do
    skip ""
    number_to_currency(5000).must_equal "$5.00"
  end
```

After running the test specs again ``rails test``, you'll see an 'S' on the specs you have skipped.




### --seed 13534

You'll notice that you will have --seed 12354 (this number will change each time the test is run), this is because minitest will randomize the order in which the tests are run to make sure tests are not failing or succeeding due to "state carry over" of a previously run test.

You can run the same instance of test sequences again by using ``rails TESTOPTS='--seed 12354'``


### Install turn gem to improve test display

Install turn in your ``gemfile``.

```ruby
group :test do
  gem 'minitest'
  gem 'capybara'
  gem 'turn'
end
```

Then run ``bundle``.

If you don't like the default layout, you can add several differnt options to customize the output. This can be done in your ``minitest_helper.rb``.

```ruby
Turn.config.format = :outline
```

When you run the tests again you'll see that the test output is now different.




### Fixtures
https://gist.github.com/821558




### Capybara MiniTest Spec

This gem can also be used to have Rspec like expecations.

```ruby
page.should have_content('Title')
```


### Alternative Setup

```ruby
# gemfile

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano'
  gem 'capistrano-passenger'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'listen'
  gem 'letter_opener'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'byebug'
  gem 'minitest'
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'poltergeist', '~> 1.8.1'
  gem 'awesome_print'
  gem "minitest-rails-capybara"
end

group :test do
  gem 'database_cleaner'
end
```

```ruby
# test/test_helper.rb

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"
require "minitest/reporters"
require 'capybara/rails'
require 'capybara/poltergeist'
require 'database_cleaner'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
  ActiveRecord::Migration.check_pending!
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :js_errors => false, :phantomjs_options => ['--load-images=no', '--ignore-ssl-errors=yes'])
  end

  Capybara.default_max_wait_time = 5
  Capybara.current_driver = :poltergeist
  Capybara.app_host = "http://localhost:3003"
  Capybara.server_host = "localhost"
  Capybara.server_port = "3003"

  self.use_transactional_tests = false

  DatabaseCleaner.strategy = :truncation
  # include Devise::Test::ControllerHelpers

  def screenshot(page)
    `open #{page.save_screenshot("log/#{Time.now.to_f}.png", :full => true)}`
  end
end

```
