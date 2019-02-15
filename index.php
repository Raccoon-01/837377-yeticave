<?php

require_once("functions.php");
require_once("data.php");

$page_content = include_template("../templates/index.php", ["item_list" => $item_list,
    "categories" => $categories]);
$layout_content = include_template("layout.php", [
    "content" => $page_content,
    "categories" => $categories,
    "title" => "Yeticave - Главная страница",

]);
print($layout_content);


