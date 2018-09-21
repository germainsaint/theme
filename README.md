# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Rolify: http://aalvarez.me/blog/posts/integrating-devise-with-rolify-in-rails.html

user_sessions
+----------------+---------------+------+-----+---------------------+----------------+
| Field          | Type          | Null | Key | Default             | Extra          |
+----------------+---------------+------+-----+---------------------+----------------+
| id             | int(11)       | NO   | PRI | NULL                | auto_increment |
| appuser_id     | int(11)       | NO   |     | NULL                |                |
| user_type      | enum('1','2') | NO   |     | NULL                |                |
| sess_token     | varchar(250)  | NO   |     | NULL                |                |
| device_id      | varchar(255)  | YES  |     | NULL                |                |
| device_token   | text          | YES  |     | NULL                |                |
| login_status   | enum('0','1') | NO   |     | NULL                |                |
| device_type    | enum('1','2') | NO   |     | NULL                |                |
| badge          | int(11)       | NO   |     | 0                   |                |
| last_login     | datetime      | NO   |     | NULL                |                |
| last_logout    | datetime      | YES  |     | NULL                |                |
| session_expiry | datetime      | NO   |     | 0000-00-00 00:00:00 |                |
| debug_mode     | tinyint(4)    | NO   |     | 1                   |                |
+----------------+---------------+------+-----+---------------------+----------------+

Tasks/ Rakefile
Example:
1.  rails g task stripe_pay create_token
Reference: stripe
https://stripe.com/docs/api#idempotent_requests
