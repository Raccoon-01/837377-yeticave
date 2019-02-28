<?php
//функция по шаблонизации
function include_template($name, $data)
{
    $name = 'templates/' . $name;
    $result = '';
    if (!is_readable($name)) {
        return $result;
    }
    ob_start();
    extract($data);

    require $name;
    $result = ob_get_clean();
    return $result;
}

//функция по форматированию стоимости
function price_format(float $item_price)
{
    $round = ceil($item_price);
    if ($round > 1000) {
        $price_format = number_format($round, 0, '.', " ");
    }
    return $price_format .= " ₽";
}
//функция для отсчета времени размещения лота на сайте
function lot_timer()
{
    $ts_midnight = strtotime("tomorrow");
    $secs_to_midnight = $ts_midnight - time();
    $hours = floor($secs_to_midnight / 3600);
    $minutes = floor(($secs_to_midnight % 3600) / 60);
    $lot_time = $hours . " : " . $minutes;
    return $lot_time;
}
