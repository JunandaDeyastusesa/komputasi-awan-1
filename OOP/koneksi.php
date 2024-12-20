<?php

class koneksi
{
  public $hostname = "mysql_db";
  public $username = "mec";
  public $password = "root";
  public $name = "db_bimbelonline";
  protected $koneksi;
  public function __construct()
  {
    $this->koneksi = new mysqli($this->hostname, $this->username, $this->password, $this->name);
    if ($this->koneksi->connect_error) {
      die("Koneksi dengan database gagal: " . $this->koneksi->connect_error);
    } else {
      echo "Koneksi berhasil!";
    }
  }
}
