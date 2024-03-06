<?php

class Conexion
{
	private $host = "localhost";
	private $port = 3306;
	private $dbName = "automotores";
	private $user = "root";
	private $pass = "";

	public function getConexion()
	{
		try {
			$pdo = new PDO(
				"mysql:host={$this->host};
				port={$this->port};
				dbname={$this->dbName};
				charset=utf8",
				$this->user,
				$this->pass
			);

			$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $pdo;
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}
}
