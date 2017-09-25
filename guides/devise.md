The proposed way is available since Devise 1.2.rc

## 0. Little note from [@1c7](https://github.com/1c7)
The following method doesn't work for me.    
Then I search around on Google, cost me about 30 minute. I tried at least 3 way to do this. (redirect after sign up)     
Finally, this work: [How To: redirect to a specific page on successful sign_in, sign_out, and or sign_up](https://github.com/plataformatec/devise/wiki/How-To:-redirect-to-a-specific-page-on-successful-sign_in,-sign_out,-and-or-sign_up)  
(My env: Rails 5, Devise 4.2)  
I don't really know should I delete this page.. ( it may work on older version? )

## 1. Make a new controller "registrations_controller.rb" and customize the appropriate method:

```ruby
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/an/example/path' # Or :prefix_to_your_route
  end
end
```

If the account that is registered is confirmable and not active yet, you have to override after_inactive_sign_up_path_for method.

```ruby
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    '/an/example/path' # Or :prefix_to_your_route
  end
end
```

You can see the whole lists of methods to customize on Devise source:

https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb

## 2. Modify config/routes.rb to use the new controller

Modify your devise_for line in routes.rb to look like this.
```ruby
devise_for :users, controllers: { registrations: "registrations" }
```

### Optionally Copy Views

Note: In rails 3.2.5 running Ruby 1.9.2-p290 the steps below don't seem to be necessary.  You just need to create your RegistrationsController and alter your routes.  Then, by virtue of inheriting from Devise::RegistrationsController, you pick up the existing Devise registrations views.  This holds regardless of whether you've created those views already with

    rails g devise:views

or not.

Note: After changing the controller in the config/routes.rb file, you will want to copy over the devise registration views over to the new app/views/registrations path.

Copy the files using "rails generate devise:views".  After doing this, you need to copy views/devise/registrations/new.html.erb to views/registrations/new.html.erb  Otherwise you will get a "Missing Template" error when you go to users/sign_up

## 3. Modify config/application.rb

You might need this line in case you encounter "MissingTemplate" error in "/users/sign_up" page.

```ruby
config.paths['app/views'] << "app/views/devise"
```
