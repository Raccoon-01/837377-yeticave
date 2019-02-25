<?php
require_once("functions.php");
require_once("data.php");
require_once("init.php");
$page_content = include_template(
    "../templates/index.php",
    ["item_list" => $item_list,
     "categories" => $categories]
);
$layout_content = include_template(
    "layout.php",
    ["content" => $page_content,
     "categories" => $categories,
     "title" => "Yeticave - Главная страница"]
);
print($layout_content);


if (!$con) {
    $error = mysqli_connect_error();
    $content = include_template('../templates/error.php', ['error' => $error]);
}
else {
    // запрос для получения списка новых лотов и для показа карточек лотов на главной странице
    $sql = "SELECT l.title, l.starting_price, l.date_of_creation, l. date_of_completion, l.image, 
           c.category, MAX(b.sum) AS 'Макс предложенная цена' FROM lots l "
           . "JOIN categories c ON c.lotsId = l.id "
           . "LEFT OUTER JOIN bets b ON b.LotsId = l.id WHERE l.date_of_completion > NOW() "
           . "GROUP BY l.title, l.starting_price, l.date_of_creation, l.image, c.category";
    if ($res = mysqli_query($con, $sql)) {
        $layout_content = mysqli_fetch_all($res, MYSQLI_ASSOC);
    }
    else {
        $content = include_template('error.php', ['error' => mysqli_error($con)]);
    }
    //запрос для получения списка категорий и для показа списка категорий в футере страницы
    $sql = "SELECT l.id, c.category FROM lots l "
           . "JOIN categories c ON l.id = c.LotsId ";
    $result= mysqli_query($con, $sql);
    if($result) {
        $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    else {
        $error = mysqli_error($con);
    }
    /*// Но чтобы проверить, что все работает корректно, добавьте руками в таблицу лотов новую запись,
   // указав в качестве даты публикации текущее время. Затем обновите главную страницу и убедитесь,
   // что в списке появилась новая карточка и она первая. Проделайте тоже самое с категориями -
   // удалите или добавьте новую
    $sql = "INSERT INTO lots (title, description, image, starting_price, date_of_creation,
           date_of_completion, betting_step, UsersId)
           VALUES ('2018 Rossignol District Snowboard', 'Доска для сноуборда', 'img/lot-1.jpg', 
           '16000', '2019-02-25 17:04:00', '2019-03-15 14:00:00', '5', '2')";
    $result = mysqli_query($con, $sql);
    if(!$result) {
        $error = mysqli_error($con);
    }
    $sql = "INSERT INTO categories SET id = '13', category = 'Доски и лыжи', LotsId = '7', css_class ='promo__item--boards'";
    $result = mysqli_query($con, $sql);
    if(!$result) {
        $error = mysqli_error($con);
    }*/
}

