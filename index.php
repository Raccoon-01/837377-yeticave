<?php
require_once("functions.php");
require_once("data.php");
require_once("init.php");
require_once("db_functions.php");

$item_list = getLots($con);
if($item_list === false) {
    $content = include_template("../templates/error.php", ["error" => mysqli_error($con)]);
    print $content;
    die();
}

$categories = getCategories($con);
if($categories === false) {
    $content = include_template("../templates/error.php", ["error" => mysqli_error($con)]);
    print $content;
    die();
}

$lot = getLot($con);
if($lot === false) {
    $content = include_template("../templates/error.php", ["error" => mysqli_error($con)]);
    print $content;
    die();
}

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

$lot_content = include_template(
    "lot.php",
    ["lot" => $lot]
);
print($lot_content);

