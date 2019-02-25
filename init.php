<?php
require_once "functions.php";
date_default_timezone_set("Asia/Almaty");

$con = mysqli_connect("localhost", "root", "Nerevar705Hero", "yeticave");
mysqli_set_charset($con, "utf8");
if ($con == false){
    print("Ошибка: Невозможно подключиться к MySQL " . mysqli_connect_error());
}
else {
    print("Соединение установлено успешно");
}



