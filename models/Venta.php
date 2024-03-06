	<?php

	require_once 'Conexion.php';

	class Venta extends Conexion
	{
		private $conexion;

		public function __construct()
		{
			$this->conexion = parent::getConexion();
		}

		public function listarVenta()
		{
			try {
				$consulta = $this->conexion->prepare('');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarVenta($data = [])
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

		public function actualizarVenta($data = [])
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

		public function eliminarVenta($id)
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
