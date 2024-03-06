<?php

require_once 'Conexion.php';

class Compra extends Conexion
{
	private $conexion;

	public function __construct()
	{
		$this->conexion = parent::getConexion();
	}

	public function listarCompra()
	{
		try {
			$consulta = $this->conexion->prepare('');
			$consulta->execute();

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function registrarCompra($data = [])
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

	public function actualizarCompra($data = [])
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

	public function eliminarCompra($id)
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
