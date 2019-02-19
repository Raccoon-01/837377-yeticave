CREATE DATABASE YetiCave;
USE YetiCave;
CREATE TABLE categories (id INT AUTO_INCREMENT PRIMARY KEY, category CHAR(50));
INSERT INTO categories (category) VALUES ("Доски и лыжи","Крепления","Ботинки","Одежда","Инструменты","Разное");
CREATE TABLE lots (id INT AUTO_INCREMENT PRIMARY KEY, title CHAR(100) NOT NULL,
description CHAR(200), image LONGBLOB NOT NULL, starting_price INTEGER NOT NULL,
date_of_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
date_of_completion DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, betting_step INTEGER NOT NULL);
CREATE TABLE bets (date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
sum INTEGER NOT NULL);
ALTER TABLE bets ADD id INT AUTO_INCREMENT PRIMARY KEY;
CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, register_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, email CHAR(25) UNIQUE NOT NULL,
name CHAR(50) UNIQUE NOT NULL, password CHAR(10) NOT NULL, avatar LONGBLOB, contacts CHAR(100) NOT NULL);
ALTER TABLE users ADD winner CHAR(50) UNIQUE NOT NULL;
ALTER TABLE users CHANGE name author CHAR(50) UNIQUE NOT NULL;
SELECT l.title, c.category, l.description, l.image, l.`starting price`, l.`date of creation`,
l.`date of completion`, l.`betting step`
FROM lots l
JOIN categories c ON l.id = c.id;
SELECT l.title, c.category, l.description, l.image, l.`starting price`, l.`date of creation`,
l.`date of completion`, l.`betting step`, u.author, u.winner
FROM lots l JOIN categories c ON l.id = c.id
JOIN users u ON l.id - u.id;
SELECT l.title, u.author, b.date, b.sum
FROM bets b JOIN users u ON b.id = u.id
JOIN lots l ON b.id = l.id;
SELECT l.title, l.description, l.image, l.`starting price`, l.`date of creation`,
l.`date of completion`, l.`betting step`, b.date, b.sum, u.register_date, u.email, u.author,
u.password, u.avatar, u.contacts, u.winner
FROM users u JOIN lots l ON u.id = l.id
JOIN bets b ON u.id = b.id;
