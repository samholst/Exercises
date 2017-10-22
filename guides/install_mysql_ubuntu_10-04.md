###Before You Begin

To check your hostname run:

```plaintext
hostname

hostname -f
```

The first command should show your short hostname, and the second should show your fully qualified domain name (FQDN).

Update your system:

```plaintext
sudo apt-get update

sudo apt-get upgrade
```

###Install MySQL

```plaintext
sudo apt-get install mysql-server
```

During the installation process, you will be prompted to set a password for the MySQL root user as shown below. Choose a strong password and keep it in a safe place for future reference.

MySQL will bind to localhost (127.0.0.1) by default. 

Allowing unrestricted access to MySQL on a public IP is not advised, but you may change the address it listens on by modifying the bind-address parameter in /etc/my.cnf. If you decide to bind MySQL to your public IP, you should implement firewall rules that only allow connections from specific IP addresses.

###Harden MySQL Server

Run the ```mysql_secure_installation script``` to address several security concerns in a default MySQL installation:

```plaintext
sudo mysql_secure_installation
```

Use MySQLYou will be given the choice to change the MySQL root password, remove anonymous user accounts, disable root logins outside of localhost, and remove test databases. It is recommended that you answer yes to these options. You can read more about the script in the MySQL Reference Manual.

The standard tool for interacting with MySQL is the mysql client, which installs with the mysql-server package. The MySQL client is accessed through a terminal.

###Root Login

To log in to MySQL as the root user:

```plaintext
mysql -u root -p
```

When prompted, enter the root password you assigned when the mysql_secure_installationscript was run.

You’ll then be presented with the MySQL monitor prompt:

To generate a list of commands for the MySQL prompt, enter \h. You’ll then see:

###Create a New MySQL User and Database

In the example below, testdb is the name of the database, testuser is the user, and passwordis the user’s password.

```plaintext
create database testdb;
create user 'testuser'@'localhost' identified by 'password';

grant all on testdb.* to 'testuser';

create database testdb;

grant all on testdb.* to 'testuser' identified by 'password';
```

You can shorten this process by creating the user while assigning database permissions:

Exit MySQL.

```plaintext
exit
```

###Create a Sample Table

Log back in as testuser.

```plaintext
mysql -u testuser -p
```

Create a sample table called customers. This creates a table with a customer ID field of the type INT for integer (auto-incremented for new records, used as the primary key), as well as two fields for storing the customer’s name.

```plaintext
use testdb;

create table customers (customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, first_name TEXT, last_name TEXT);
```

Then exit MySQL.

```plaintext
exit
```

###Reset the MySQL Root Password

If you forget your MySQL root password, it can be reset.

Stop the current MySQL server instance:

```plaintext
sudo service mysql stop
```

Use dpkg to re-run the configuration process that MySQL goes through on first installation. You will again be asked to set a root password.

```plaintext
sudo dpkg-reconfigure mysql-server-5.5
```

Then start MySQL:

```plaintext
sudo service mysql start
```

You’ll now be able to log in again using mysql -u root -p.

###Tune MySQL

MySQL Tuner is a Perl script that connects to a running instance of MySQL and provides configuration recommendations based on workload. Ideally, the MySQL instance should have been operating for at least 24 hours before running the tuner. The longer the instance has been running, the better advice MySQL Tuner will give.

Install MySQL Tuner from Ubuntu’s repositories:

```plaintext
sudo apt-get install mysqltuner
```

To run it:

You will be asked for the MySQL root user’s name and password. The output will show two areas of interest: General recommendations and Variables to adjust

```plaintext
mysqltuner
```

MySQL Tuner is an excellent starting point to optimize a MySQL server, but it would be prudent to perform additional research.

###More Information

You may wish to consult the following resources for additional information on this topic. While these are provided in the hope that they will be useful, please note that we cannot vouch for the accuracy or timeliness of externally hosted materials.

MySQL 5.5 Reference Manual (http://dev.mysql.com/doc/refman/5.5/en/)
PHP MySQL Manual (http://us2.php.net/manual/en/book.mysql.php)
Perl DBI examples for DBD::mysql (http://sql-info.de/mysql/examples/Perl-DBI-examples.html)
MySQLdb User’s Guide (http://mysql-python.sourceforge.net/MySQLdb.html)
