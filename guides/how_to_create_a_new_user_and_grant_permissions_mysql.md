###How to Create a New User

Let’s start by making a new user within the MySQL shell:

```plaintext
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
```

Sadly, at this point newuser has no permissions to do anything with the databases. In fact, if newuser even tries to login (with the password, password), they will not be able to reach the MySQL shell.

Therefore, the first thing to do is to provide the user with access to the information they will need.

```plaintext
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
```

The asterisks in this command refer to the database and table (respectively) that they can access—this specific command allows to the user to read, edit, execute and perform all tasks across all the databases and tables.

Once you have finalized the permissions that you want to set up for your new users, always be sure to reload all the privileges.

```plaintext
FLUSH PRIVILEGES;
```

Your changes will now be in effect.

###How To Grant Different User Permissions

Here is a short list of other common possible permissions that users can enjoy.

- ALL PRIVILEGES- as we saw previously, this would allow a MySQL user all access to a designated database (or if no database is selected, across the system)
- CREATE- allows them to create new tables or databases
- DROP- allows them to them to delete tables or databases
- DELETE- allows them to delete rows from tables
- INSERT- allows them to insert rows into tables
- SELECT- allows them to use the Select command to read through databases
- UPDATE- allow them to update table rows
- GRANT OPTION- allows them to grant or remove other users' privileges
To provide a specific user with a permission, you can use this framework:

```plaintext
GRANT [type of permission] ON [database name].[table name] TO ‘[username]’@'localhost’;
```

If you want to give them access to any database or to any table, make sure to put an asterisk in the place of the database name or table name.

Each time you update or change a permission be sure to use the Flush Privileges command.

If you need to revoke a permission, the structure is almost identical to granting it:

```plaintext
REVOKE [type of permission] ON [database name].[table name] FROM ‘[username]’@‘localhost’;
```

Just as you can delete databases with DROP, you can use DROP to delete a user altogether:

```plaintext
DROP USER ‘demo’@‘localhost’;
```

To test out your new user, log out by typing

```plaintext
quit
```

and log back in with this command in terminal:

```plaintext
mysql -u [username] -p
```
