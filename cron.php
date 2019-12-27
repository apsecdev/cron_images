<?php
// get images and leave everything else alone

function getImagesFromDir($path) {
    $images = array();
    if ( $img_dir = @opendir($path) ) {
        while ( false !== ($img_file = readdir($img_dir)) ) {
            // checks for gif, jpg, png
            if ( preg_match("/(\.gif|\.jpg|\.png)$/", $img_file) ) {
                $images[] = $img_file;
            }
        }
        closedir($img_dir);
    }
    return $images;
}

// pick random image

function getRandomFromArray($array) {
    $num = array_rand($array);
    return $array[$num];
}

$path = "***PATH_TO_IMAGES***";
$imgList = getImagesFromDir($path);
$img = getRandomFromArray($imgList);

// generate .htaccess

$htaccess = "Options +FollowSymLinks\n\nRewriteEngine on\n\nRewriteRule ^background\.jpg$ http://%{HTTP_HOST}/$path/$img [L]\n\n";
        file_put_contents($path.'/.htaccess', $htaccess);
