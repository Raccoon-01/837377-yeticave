<?php function include_template($name, $data) {
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
};



function price_format (float $item_price) {
    $round = ceil($item_price);
    if ($round > 1000) {
        $price_format = number_format($round, 0, '.', " ");
    }
    return $price_format .= " ₽";
};
?>
