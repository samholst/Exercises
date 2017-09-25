## Login
- heroku login

## Create An App
- heroku create [UNIQUE APP NAME]

## Setting ENV Variables
- heroku config:set [ANY .ENV FILES]

## Push To Heroku To Finalize
- git push heroku master

## Setup The Database
- heroku run rails db:migrate
- heroku run rails db:seed
- heroku run rails db:create (Rails 4 and below)

## Resetting The Database
- heroku pg:reset
- heroku restart


<!-- List of current heroku apps -->
<!-- https://sams-angular-app.herokuapp.com/ | https://git.heroku.com/sams-angular-app.git -->
<!-- https://git.heroku.com/sam-devs-avail.git | https://sam-devs-avail.herokuapp.com/  -->
