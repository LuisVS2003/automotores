<?php

require_once 'Conexion.php';

class Marca extends Conexion
{
	private $conexion;

	public function __construct()
	{
		$this->conexion = parent::getConexion();
	}

	public function listarMarca()
	{
		try {
			$consulta = $this->conexion->prepare('');
			$consulta->execute();

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function registrarMarca($data = [])
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

	public function actualizarMarca($data = [])
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

	public function eliminarMarca($id)
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
