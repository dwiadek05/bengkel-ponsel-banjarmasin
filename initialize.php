<?php
$dev_data = array(
    'id' => '-1',
    'firstname' => 'Developer',
    'lastname' => '',
    'username' => 'dev_oretnom',
    'password' => '5da283a2d990e8d8512cf967df5bc0d0',
    'last_login' => '',
    'date_updated' => '',
    'date_added' => ''
);

if (!defined('base_url'))
    define('base_url', 'http://185.201.9.103');
if (!defined('base_app'))
    define('base_app', str_replace('\\', '/', __DIR__) . '/');
if (!defined('dev_data'))
    define('dev_data', $dev_data);

if (!defined('DB_SERVER'))
    define('DB_SERVER', "mysql"); // menggunakan nama service dari docker-compose
if (!defined('DB_USERNAME'))
    define('DB_USERNAME', "codeigniter");
if (!defined('DB_PASSWORD'))
    define('DB_PASSWORD', "secret");
if (!defined('DB_NAME'))
    define('DB_NAME', "bengkelponselbanjarmasin");
?>
