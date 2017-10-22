### Installation and Setup

```plaintext
sudo su - root 
cd /usr/sbin
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
./certbot-auto
```

### Nginx Configuration

Add the following to your nginx server configuration block ``vim /opt/nginx/conf/sites-enabled/yourdomain.com``

```plaintext
  location ^~ /.well-known/ {
    root /usr/share/nginx/html;
  }
```

Let's create a folder for well known ``mkdir -p /usr/share/nginx/html``

### LetsEncrypt Configuration

Create ``mkdir -p /etc/letsencrypt && vim /etc/letsencrypt/cli.ini`` and add the following template. Make sure to change domains, email, etc options.

```plaintext
# All flags used by the client can be configured here. Run Certbot with
# "--help" to learn more about the available options.

# Use a 4096 bit RSA key instead of 2048
rsa-key-size = 4096

# Uncomment and update to register with the specified e-mail address
# email = foo@example.com

# Uncomment and update to generate certificates for the specified
# domains.
domains = example.com, www.example.com

# Uncomment to use a text interface instead of ncurses
# text = True

authenticator = webroot
webroot-path = /usr/share/nginx/html
```

Test by running ``certbot-auto certonly -c /etc/letsencrypt/cli.ini``

If everything goes well you should see:

```plaintext
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at
   "/etc/letsencrypt/live/example.com/fullchain.pem". Your cert will
   expire on xxxx-xx-xx. To obtain a new or tweaked version of this
   certificate in the future, simply run certbot-auto again. To
   non-interactively renew *all* of your certificates, run
   "certbot-auto renew"
```

Now add the certs to your nginx server block and your site will be encrypted. vim /opt/nginx/conf/sites-enabled/yourdomain.com

```plaintext
server {
  listen         80;
  server_name    .example.com;
  #server_name _; # to match all domains on port 80.

  location / {
    return       301 https://$host$request_uri;
  }
  location ^~ /.well-known/ {
    root /usr/share/nginx/html;
  }
}

server {
  listen 443 ssl;
  server_name example.com;
  ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
  ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers         HIGH:!aNULL:!MD5;
  add_header Strict-Transport-Security "max-age=31536000";
}
```

### Auto Renew

Run ``certbot-auto renew --dry-run`` to test that renewals work.

If successful then run ``crontab -e`` and add:

```plaintext
13 22 * * * /usr/sbin/certbot-auto renew --quiet --no-self-upgrade
15 22 * * * service nginx restart
```

Now your server will check if it needs new certs once a day.
