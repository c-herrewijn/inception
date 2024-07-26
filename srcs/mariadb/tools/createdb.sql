-- create database
create database if not exists inception;
use inception;

-- create database user
CREATE USER 'user1' @'%' IDENTIFIED BY 'password1';
GRANT ALL PRIVILEGES ON inception.* TO 'user1' @'%';
FLUSH PRIVILEGES;
