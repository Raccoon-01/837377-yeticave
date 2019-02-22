INSERT INTO categories (category, css_class, LotsId) VALUES("Доски и лыжи", "promo__item--boards", "1"),
("Крепления", "promo__item--attachment", "3"), ("Ботинки", "promo__item--boots", "4"),
("Одежда", "promo__item--clothing", "5"), ("Инструменты", "promo__item--tools", "2"),
("Разное", "promo__item--other", "6");

INSERT INTO users (register_date, email, name, password, contacts) VALUES (now(), "puppy.co@gmail.com",
"Villain", "32515sdas", "LA city"), (now(), "baby.corp@gmail.com", "Tim", "25ffd54fs", "NY city"),
(now(), "monsterSul.inc@gmail.com", "Sullivan", "25fhjgsf", "Monstrosity"), (now(), "monsterWaz.inc@gmail.com",
"Wazowski", "2xdfgd145sff", "Monstrosity");

INSERT INTO lots (title, description, image, starting_price, date_of_creation, date_of_completion,
betting_step, UsersId) VALUES ("2014 Rossignol District Snowboard", "Доска для сноуборда", "img/lot-1.jpg",
"10999", NOW(), "2019-02-28 14:00:00", "5", "2"), ("DC Ply Mens 2016/2017 Snowboard", "Доска для сноуборда", "img/lot-2.jpg",
"159999", NOW(), "2019-02-28 14:00:00", "5", "2"), ("Крепления Union Contact Pro 2015 года размер L/XL", "Крепление большого
размера от известной фирмы", "img/lot-3.jpg", "8000", NOW(), "2019-02-28 14:00:00", "5", "3"), ("Ботинки для сноуборда DC Mutiny Charocal",
"Ботинки для сноуборда", "img/lot-4.jpg", "10999", NOW(), "2019-02-28 14:00:00", "5", "4"), ("Куртка для сноуборда DC Mutiny Charocal",
"Куртка для сноуборда", "img/lot-5.jpg", "7500", NOW(), "2019-02-28 14:00:00", "5", "3"), ("Маска Oakley Canopy", "Маска",
"img/lot-6.jpg", "5400", NOW(), "2019-02-28 14:00:00", "5", "4");

INSERT INTO bets (date, sum, UsersId, LotsId) VALUES (now(), "159999", "1", "2"), (now(), "10999", "1", "4"),
(now(), "160000", "2", "2"), (now(), "11500", "3", "4"), (now(), "8500", "4", "3"),
(now(), "11500", "4", "5");

/*получить все категории*/
SELECT category, css_class FROM categories ORDER BY category ASC;

/*получить самые новые, открытые лоты.
Каждый лот включает название, стартовую цену, ссылку на изображение, цену, название категории.
Группировка по названию и макс. цене)*/
SELECT l.title, l.starting_price, l.date_of_creation, l.image, c.category, MAX(b.sum) AS "Макс предложенная цена"
FROM lots l
JOIN categories c ON c.lotsId = l.id
LEFT OUTER JOIN bets b ON b.LotsId = l.id
WHERE date_of_completion > NOW() GROUP BY l.title, l.starting_price, l.date_of_creation, l.image, c.category;

/*показать лот по его id. Получите также название категории, к которой принадлежит лот*/
SELECT l.id, c.category FROM lots l
JOIN categories c ON l.id = c.LotsId;

/*обновить название лота по его идентификатору*/
UPDATE lots SET title = "NEW 2014 Rossignol District Snowboard" WHERE id = "1";

/*получить список самых свежих ставок для лота по его идентификатору, ставки созданные
не ранее 5 дней вкл., LotsId это ключ на Id лота из таблицы lots*/
SELECT LotsId, date, sum
FROM bets WHERE LotsId = "4" AND TO_DAYS(NOW())-TO_DAYS(date) <= 20;

