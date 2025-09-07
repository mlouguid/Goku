<?php

declare(strict_types=1);

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

return [
    'app_name' => $_ENV['APP_NAME'],
    'app_root' => dirname(dirname(__FILE__)) . '/app/',
    'app_url' => $_ENV['APP_URL'],
    'database' => [
        'driver'   => 'pgsql',  // PostgreSQL driver
        'host'     => $_ENV['PGSQL_HOST'],
        'port'     => $_ENV['PGSQL_PORT'] ?? 5432,
        'dbname'   => $_ENV['PGSQL_DATABASE'],
        'username' => $_ENV['PGSQL_USER'],
        'password' => $_ENV['PGSQL_PASSWORD'],
    ],
    'redis' => [
        'host' => $_ENV['REDIS_HOST'],
        'port' => $_ENV['REDIS_PORT'] ?? 6379,
    ],
];
