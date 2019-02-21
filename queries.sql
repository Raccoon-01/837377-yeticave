INSERT INTO categories (category, css_class, LotsId) VALUES("Доски и лыжи", "promo__item--boards", "1"),
("Крепления", "promo__item--attachment", "3"), ("Ботинки", "promo__item--boots", "4"),
("Одежда", "promo__item--clothing", "5"), ("Инструменты", "promo__item--tools", "2"),
("Разное", "promo__item--other", "6");

INSERT INTO users (register_date, email, name, password, contacts) VALUES (now(), "puppy.co@gmail.com",
"Villain", "32515sdas", "LA city"), (now(), "baby.corp@gmail.com", "Tim", "25ffd54fs", "NY city"),
(now(), "monsterSul.inc@gmail.com", "Sullivan", "25fhjgsf", "Monstrosity"), (now(), "monsterWaz.inc@gmail.com",
"Wazowski", "2xdfgd145sff", "Monstrosity");

INSERT INTO lots (title, description, image, starting_price, date_of_creation,
betting_step, UsersId) VALUES ("2014 Rossignol District Snowboard", "Доска для сноуборда", "img/lot-1.jpg",
"10999", NOW(), "5", "2"), ("DC Ply Mens 2016/2017 Snowboard", "Доска для сноуборда", "img/lot-2.jpg",
"159999", NOW(), "5", "2"), ("Крепления Union Contact Pro 2015 года размер L/XL", "Крепление большого
размера от известной фирмы", "img/lot-3.jpg", "8000", NOW(), "5", "3"), ("Ботинки для сноуборда DC Mutiny Charocal",
"Ботинки для сноуборда", "img/lot-4.jpg", "10999", NOW(), "5", "4"), ("Куртка для сноуборда DC Mutiny Charocal",
"Куртка для сноуборда", "img/lot-5.jpg", "7500", NOW(), "5", "3"), ("Маска Oakley Canopy", "Маска",
"img/lot-6.jpg", "5400", NOW(), "5", "4");

INSERT INTO bets (date, sum, UsersId, LotsId) VALUES (now(), "159999", "1", "2"), (now(), "10999", "1", "4");

SELECT l.title, c.category, l.description, l.image, l.starting_price, l.date_of_creation,
       l.date_of_completion, l.betting_step
FROM lots l
       JOIN categories c ON l.id = c.id;

SELECT l.title, c.category, l.description, l.image, l.starting_price, l.date_of_creation,
       l.date_of_completion, l.betting_step, u.name, l.winner
FROM lots l JOIN categories c ON l.id = c.id
            JOIN users u ON l.id - u.id;

SELECT l.title, u.name, b.date, b.sum
FROM bets b JOIN users u ON b.id = u.id
            JOIN lots l ON b.id = l.id;

SELECT l.title, l.description, l.image, l.starting_price, l.date_of_creation,
       l.date_of_completion, l.betting_step, b.date, b.sum, u.register_date, u.email, u.name,
       u.password, u.avatar, u.contacts, l.winner
FROM users u JOIN lots l ON u.id = l.id
             JOIN bets b ON u.id = b.id;

SELECT category FROM categories ORDER BY category ASC;

SELECT title, starting_price, date_of_creation, image, category FROM lots, categories
WHERE date_of_creation > 2019-02-20 ORDER BY date_of_creation DESC;

SELECT LotsId, category FROM categories ORDER BY LotsId ASC;

UPDATE lots SET title = "NEW 2014 Rossignol District Snowboard" WHERE id = "1";

SELECT date, LotsId FROM bets WHERE date > 2019-02-20;
