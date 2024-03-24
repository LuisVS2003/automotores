<?php

require_once 'Conexion.php';

class DetalleCompra extends Conexion
{
	private $conexion;

	public function __construct()
	{
		$this->conexion = parent::getConexion();
	}

	public function listarDetalleCompra()
	{
		try {
			$consulta = $this->conexion->prepare('CALL spu_detalle_compra_listar()');
			$consulta->execute();

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function registrarDetalleCompra($data = [])
	{
		try {
			$consulta = $this->conexion->prepare('CALL registrarDetalleCompra(?,?,?,?)');
			$consulta->execute(
				array(
					$data['compra_id'],
					$data['producto_id'],
					$data['cantidad'],
					$data['almacen_id']
				)
			);

			return $consulta->fetch(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function actualizarDetalleCompra($data = [])
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

	public function eliminarDetalleCompra($id)
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
