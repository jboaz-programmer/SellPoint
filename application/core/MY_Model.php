<?php
class MY_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        // Set MySQL timezone to match PHP timezone
        $this->db->query("SET time_zone = '+03:00'");
    }
}
