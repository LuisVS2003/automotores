<?php

require_once 'Conexion.php';

class Almacen extends Conexion
{
	private $conexion;

	public function __construct()
	{
		$this->conexion = parent::getConexion();
	}

	public function listarAlmacen()
	{
		try {
			$consulta = $this->conexion->prepare('CALL spu_almacen_listar()');
			$consulta->execute();

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function registrarAlmacen($data = [])
	{
		try {
			$consulta = $this->conexion->prepare('CALL registrarAlmacen(?,?,?,?)');
			$consulta->execute(
				array(
					$data['direccion'],
					$data['referencia'],
					$data['latitud'],
					$data['longitud']
				)
			);

			return $consulta->fetch(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function actualizarAlmacen($data = [])
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

	public function eliminarAlmacen($id)
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
