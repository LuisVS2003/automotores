<?php

require_once 'Conexion.php';

class Producto extends Conexion
{
	private $conexion;

	public function __construct()
	{
		$this->conexion = parent::getConexion();
	}

	public function listarProducto()
	{
		try {
			$consulta = $this->conexion->prepare('CALL spu_producto_listar()');
			$consulta->execute();

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function obtenerProducto($data = [])
	{
		try {
			$consulta = $this->conexion->prepare('CALL listarProductoId(?)');
			$consulta->execute(
				array(
					$data['id']
				)
			);

			return $consulta->fetch(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function registrarProducto($data = [])
	{
		try {
			$consulta = $this->conexion->prepare('CALL registrarProducto(?,?,?,?,?,?,?)');
			$consulta->execute(
				array(
					$data['categoria_id'],
					$data['marca_id'],
					$data['nombre'],
					$data['codigo'],
					$data['descripcion'],
					$data['precio'],
					$data['imagen']
				)
			);

			return $consulta->fetch(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}

	public function actualizarProducto($data = [])
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

	public function eliminarProducto($id)
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

	public function buscarProducto($nombre)
	{
		try {
			$consulta = $this->conexion->prepare('CALL buscarProducto(?)');
			$consulta->execute(
				array(
					$nombre
				)
			);

			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		} catch (Exception $e) {
			die($e->getMessage());
		}
	}
}
