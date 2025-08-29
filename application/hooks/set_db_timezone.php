<?php
function set_db_timezone()
{
    $CI =& get_instance();
    $CI->db->query("SET time_zone = '+03:00'");
}