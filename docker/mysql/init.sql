CREATE DATABASE IF NOT EXISTS portfolio_testing
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON portfolio_testing.* TO 'portfolio'@'%';
