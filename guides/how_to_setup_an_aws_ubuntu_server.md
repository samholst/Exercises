AWS can be a very confusing system to work with, if you don't know much about it. I have researched many guides and manuals online, and never found one that had everything you needed, and didn't make you spend hours searching Google for commands and answers that none of these guides had. This is why I wanted to write a guide on this subject. I have put everything you will ever need to setup an AWS Rails Server here. In this guide, I will show you how to set up the following items:

- Route 53
- EC2
- Elastic IP
- SSH into our Ubuntu box
- Install Ruby
- Install Rails gem
- Install Passenger
- Install Apache2
- Set up PostgreSQL
- Deploy our app in production mode

First off, let's start with setting up our AWS server with the domain name we have already purchased. Go to Route53 in your AWS console, click on Hosted zones, then Create Hosted Zone at the top of the page. Enter your domain name in the field and set the type to Public Hosted Zone. Amazon will automatically give you NS records which you will need to update on the registrar you bought your domain name from. Once you have updated your NS records, it is now time to create our EC2 instance.

Head to the Amazon services page where all their services are listed. Then click on Launch Instance to start the process to create a new one. Select Ubuntu Server 16.04 LTS (HVM), SSD Volume Type, you won’t be charged for it if this is your first time using AWS, then select t2.micro which has Free tier eligible underneath it in green. Click Review and Launch, then click Launch. You will be asked to set a security .pem key file, create one and save it for later (make sure to put this in your home directory on your mac), you will need this to SSH in the server using the terminal later.

Congratulations! We have successfully created our Ubuntu Server Box! Now we need to set up an Elastic IP which will set a Static IP for our server. This will make it so our IP Address never changes and will advert any issues with future features. Now, head over on the left underneath Network and Security and select Elastic IP. Click on the blue Allocate new address button at the top and follow the steps to create a new Elastic IP. You will be asked to select your current EC2 instance you want to associate it with, select the box we just created.

Once you have successfully attached the new Elastic IP to your box, copy the IP Address and head back on over to your Route 53 Hosted Zone we created just a few minutes ago. Select Create Record Set and add two new A- IPv4 Address Records, one with your site as domain.com and another as www.domain.com. You will place the Elastic IP we created in the value box for both of these. This will redirect any requests to your domain to the IP we attached it to.

We also need to enable our http port 80, which is the default port your site will be directed to when someone visits it. Go to EC2, Network and Security, Security Groups, and find your instance you created. It will look somewhat like this "launch-wizard-2 created 2017-07-30T18:18:55.754-06:00". At the bottom of the screen click on Inbound then click edit. Once there, make sure that you have these rules:

| Type            | Protocol | Port Range | Source |
| --------------- | -------- | ---------- | -------|
| HTTP            | TCP      | 80         | 0.0.0.0/0 |
| HTTP            | TCP      | 80         | ::/0 |
| PostgreSQL      | TCP      | 5432       | 0.0.0.0/0 |
| SSH             | TCP      | 22         | 0.0.0.0/0 |
| SMTP            | TCP      | 25         | 0.0.0.0/0 |
| Custom TCP Rule | TCP      | 3000       | 0.0.0.0/0 |
| HTTPS           | TCP      | 443        | 0.0.0.0/0 |
| HTTPS           | TCP      | 443        | ::/0 |

It’s now time to SSH into our Ubuntu Server. On Mac OSX, open up a terminal and head to the directory where you saved your .pem file. Give the file the right permissions to use it in your terminal and make it secure.

```plaintext
chmod 600 myrsafile.pem
```
Once done, run this command:

```plaintext
ssh -i yourkey.pem ubuntu@ec2-yourip.yourregion.compute.amazonaws.com
```

The last part of this command you will copy and paste by going to your EC2 page, then Instance category, click on Instance, and copy and paste the Public DNS (IPv4) found in the table displayed on that page. Once you have successfully entered your server, we will now get started on installing Ruby.

Let’s update the current packages.


```plaintext
sudo apt-get update
```

We will now download the dependencies needed to run Ruby, PostgresSQL, and Rails.

Let’s get some of the required packages to run our programs.

```plaintext
sudo apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev libsqlite3-dev sqlite3
```

We will now make a new directory in which we will install the latest Ruby version. Run the following commands.

```plaintext
mkdir ~/ruby

cd ruby/

wget https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz

tar -xzf ruby-2.4.1.tar.gz

cd ruby-2.4.1/

./configure

make

sudo make install
```

What we did above was create a Ruby directory, downloaded the latest version 2.4.1, unzipped the tar.gz, configured Ruby with our Ubuntu system—overriding the previous version of it on the system, then we configured and installed it on Ubuntu.

If you did it all right, type ruby -v in your terminal and you should get the output ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux].

Now let’s remove the directory we created because we no longer need it.

```plaintext
rm -rf ~/ruby
```

Now let’s install the Apache Web Server.

```plaintext
sudo apt-get install apache2
```

We will now get a program called Passenger which will help us run our Rails Server we are going to create later.

```plaintext
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
```

Open up the file that was just downloaded

```plaintext
sudo nano /etc/apt/sources.list.d/passenger.list
```

and place the following code within it .

```plaintext
deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main
```

Change the permissions of the files so that only root can access them.

```plaintext
sudo chown root: /etc/apt/sources.list.d/passenger.list

sudo chmod 600 /etc/apt/sources.list.d/passenger.list
```

We will now run another update that will get our Passenger server.

```plaintext
sudo apt-get update
```

We also need to install a mod that will integrate with Apache to run our Rails App.

```plaintext
sudo apt-get install libapache2-mod-passenger
```

Enable the new module using the code below, and then restart the Apache Server.

```plaintext
sudo a2enmod passenger

sudo service apache2 restart
```

We also need to install some developer dependencies for Apache which will help us verify if Passenger was installed correctly.

```plaintext
sudo apt-get install apache2-dev
```

Check to see now if Passenger was installed correctly, if it was you will see green checkmarks next to all the items. Select both Apache and Passenger when running the inspection test. If there are any issues with the installations, this validation will guide you through how to fix them.

```plaintext
sudo /usr/bin/passenger-config validate-install
```

We can now remove the old Ruby bin locations with these commands.

```plaintext
sudo rm /usr/bin/ruby

sudo ln -s /usr/local/bin/ruby /usr/bin/ruby
```

If you have a current github project, clone it now in your home directory and verify that Passenger is now running by running the following command. If you get output, you are all set. Please also not that if you have any .env files or hidden files, you will also need to import those over as well for your project to run.

```plaintext
sudo /usr/sbin/passenger-memory-stats
```

Install PostgreSQL.

```plaintext
sudo apt-get install postgresql postgresql-contrib
```

We now need to enter into the Postgres console to add a new user for creating our apps databases. Run the following commands.

```plaintext
sudo -i -u postgres

psql

create user "youruser" with password ‘yourpassword’;

create database "appname_production" owner "youruser";
```

Run the following command to set the root Postgres password.

```plaintext
\password
```

Exit out now by typing \q and then type exit to leave the PostgreSQL console. Next, install the following libraries.

```plaintext
sudo apt-get install python-psycopg2

sudo apt-get install libpq-dev
```

After installing those libraries, run sudo nano /etc/postgresql/9.5/main/pg_hba.conf and change all of the peer words to md5. This will allow our app access to create databases without needing to type in any passwords, this will also avoid future permission errors later on.

Now, let’s check out our current gem list. CD into your current app project and run the following command.

```plaintext
gem list
```

All good! Now install Rails using the following command to get the latest version.

```plaintext
sudo gem install rails
```

To verify that Rails is installed, run rails -v.

Edit your Gemfile and remove the comment in front of therubyracer so that our server can run in the background with Passenger.

```plaintext
sudo nano Gemfile
```

Then run a bundle install.

Re-update all the Ubuntu resources to prepare for the PostgreSQL installation.

```plaintext
sudo apt-get update
```

We need to create a new sites-available that will send traffic to our app and also run it with Apache Server.

```plaintext
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/ yourappname.conf
```

Nano into the new file and delete everything that is already there, then add the following lines:

```plaintext
sudo nano /etc/apache2/sites-available/yourappname.conf
```

```plaintext
<VirtualHost *:80>

ServerName domain.com

ServerAlias www.domain.com

ServerAdmin domain@gmail.com

DocumentRoot /path/to/your/app/public

RailsEnv production

PassengerRuby /usr/local/bin/ruby

ErrorLog ${APACHE_LOG_DIR}/error.log

CustomLog ${APACHE_LOG_DIR}/access.log combined

<Directory "/path/to/your/app/public">

        Options FollowSymLinks

        Require all granted

</Directory>

</VirtualHost>
```

We need to disable the default site and enable ours as the one available. Make sure you point your app to the public directory or it will not be able to find and load your app.

```plaintext
sudo a2dissite 000-default

sudo a2ensite yourappname

sudo service apache2 restart
```

You will then need to configure the test, development, and production username and passwords in your database.yml file.

```plaintext
nano config/database.yml
```

Let’s now create our databases (it may already exist from previous commands we have done, so ignore it if that’s the case) and migrate our current schemas.

```plaintext
rails db:create RAILS_ENV=production

rails db:migrate RAILS_ENV=production

rails db:seed RAILS_ENV=production

rails assets:precompile RAILS_ENV=production
```

Restart the Apache Server so that the changes will take effect.

```plaintext
sudo service apache2 restart
```

You did it! You have set up your Ubuntu 16.04 Passenger/Apache Rails Server!
