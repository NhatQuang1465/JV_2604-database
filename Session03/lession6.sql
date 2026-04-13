CREATE SCHEMA library;
CREATE TABLE library.books(
book_id INT PRIMARY KEY,
title VARCHAR(50),
author VARCHAR(50),
published_year INT,
available boolean DEFAULT TRUE
);

CREATE TABLE library.members(
member_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50) UNIQUE,
join_date DATE DEFAULT CURRENT_DATE
);