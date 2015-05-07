# CRTA1
Php project

Requirements for Flight:

Configure your webserver.


For Apache, edit your .htaccess file with the following:

RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-f

RewriteCond %{REQUEST_FILENAME} !-d

RewriteRule ^(.*)$ index.php [QSA,L]


For Nginx, add the following to your server declaration:

server {
    location / {
        try_files $uri $uri/ /index.php;
    }
}


For WAMP leave it empty. 
Xamp, Lamp and Mamp are not tested!!!