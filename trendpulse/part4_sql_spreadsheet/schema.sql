CREATE DATABASE IF NOT EXISTS trendpulse_db;
USE trendpulse_db;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE videos (
    video_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255),
    channel_title VARCHAR(150),
    category_id INT,
    publish_time DATETIME,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE trending_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id VARCHAR(50),
    country VARCHAR(10),
    trending_date DATE,
    views INT,
    likes INT,
    dislikes INT,
    comment_count INT,
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);