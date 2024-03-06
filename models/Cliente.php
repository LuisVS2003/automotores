<?php

require_once 'Conexion.php';

class Cliente extends Conexion
{
	private $conexion;

	public function __construct()
	{
		$this->conexion = parent::getConexion();
	}

	public function listarCliente()
	{
		try {
			$consulta = $this->conexion->prepare('');
			$consulta->execute();

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function registrarCliente($data = [])
	{
		try {
			$consulta = $this->conexion->prepare('');
			$consulta->execute(
				array()
			);

			return $consulta->fetch(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function actualizarCliente($data = [])
	{
		try {
			$consulta = $this->conexion->prepare('');
			$consulta->execute(
				array()
			);

			return true;
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function eliminarCliente($id)
	{
		try {
			$consulta = $this->conexion->prepare('');
			$consulta->execute(
				array($id)
			);

			return true;
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}
}
