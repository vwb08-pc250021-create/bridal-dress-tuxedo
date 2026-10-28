-- MySQL 8.4: management-related subset of the supplied basic design.
-- No sample accounts or production data are included.
USE bridal;
CREATE TABLE IF NOT EXISTS stores (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 store_name VARCHAR(100) NOT NULL,
 postal_code CHAR(7),
 address VARCHAR(150),
 phone VARCHAR(11),
 theme_color CHAR(6),
 logo_url VARCHAR(512),
 description TEXT,
 delete_flag TINYINT NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS users (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 store_id INT,
 email VARCHAR(256) NOT NULL UNIQUE,
 password_hash VARCHAR(256) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 last_name_kana VARCHAR(30),
 first_name_kana VARCHAR(30),
 postal_code CHAR(7),
 address VARCHAR(150),
 phone VARCHAR(11),
 role TINYINT NOT NULL,
 delete_flag TINYINT NOT NULL DEFAULT 0,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_users_store FOREIGN KEY (store_id) REFERENCES stores(id),
 CONSTRAINT chk_users_role CHECK (role BETWEEN 0 AND 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
