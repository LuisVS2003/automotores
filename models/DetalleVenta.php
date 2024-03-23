	<?php

	require_once 'Conexion.php';

	class DetalleVenta extends Conexion
	{
		private $conexion;

		public function __construct()
		{
			$this->conexion = parent::getConexion();
		}

		public function listarDetalleVenta()
		{
			try {
				$consulta = $this->conexion->prepare('CALL spu_detalle_venta_listar()');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarDetalleVenta($data = [])
		{
			try {
				$consulta = $this->conexion->prepare('CALL registrarDetalleVenta(?,?,?);');
				$consulta->execute(
					array(
						$data['venta_id'],
						$data['producto_id'],
						$data['cantidad']
					)
				);

				return $consulta->fetch(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function actualizarDetalleVenta($data = [])
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

		public function eliminarDetalleVenta($id)
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
