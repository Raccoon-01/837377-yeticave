<?php
// функция запрос для получения списка новых лотов и для показа карточек лотов на главной странице
function getLots($con)
{
    $sql = "SELECT l.title, l.price, l.img_link, c.name FROM lots l "
           . "JOIN categories c ON c.lotsId = l.id "
           . "GROUP BY l.title, l.price, l.img_link, c.name";
    $res = mysqli_query($con, $sql);
    if($res === false){
        return false;
    }
    return mysqli_fetch_all($res, MYSQLI_ASSOC);
}

//функция запрос для получения списка категорий и для показа списка категорий в футере страницы
function getCategories($con)
{
    $sql = "SELECT c.name, c.img_background FROM categories c ";
    $res = mysqli_query($con, $sql);
    if($res === false){
        return false;
    }
    return mysqli_fetch_all($res, MYSQLI_ASSOC);
}

/*функция для каждого лота
function get_Lot($con)
{
    $sql = "SELECT l.title, l.price, l.img_link, c.name FROM lots l "
        . "JOIN categories c ON c.lotsId = l.id "
        . "GROUP BY l.title, l.price, l.img_link, c.name";
    $res = mysqli_query($con, $sql);
    if($res === false){
        return false;
    }
    return mysqli_fetch_all($res, MYSQLI_ASSOC);
}*/

function getLot($con)
{
    $sql = "SELECT id FROM lots";
    $res = mysqli_query($con, $sql);
    if($res === false){
        return false;
    }
    return mysqli_fetch_all($res, MYSQLI_ASSOC);

    if(isset($_GET["tab"]) && $_GET["tab"] == "id") {$id_field = "dt_add";}

    $sql = "SELECT l.id, l.title, l.description, l.img_link, c.name FROM lots l "
        . "JOIN categories c ON c.lotsId = l.id "
        . "GROUP BY l.title, l.description, l.img_link, c.name "
        . "ORDER BY l.' . $id_field  . ' DESC LIMIT 6";
    $res = mysqli_query($con, $sql);
    if($res === false){
        return false;
    }
    return mysqli_fetch_all($res, MYSQLI_ASSOC);
}

