	<?php

	require_once 'Conexion.php';

	class Movimiento extends Conexion
	{
		private $conexion;

		public function __construct()
		{
			$this->conexion = parent::getConexion();
		}

		public function listarMovimiento()
		{
			try {
				$consulta = $this->conexion->prepare('CALL listarMovimientos()');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarMovimiento($data = [])
		{
			try {
				$consulta = $this->conexion->prepare('CALL registrarMovimiento(?,?,?,?)');
				$consulta->execute(
					array(
						$data['kardexId'],
						$data['cantidad'],
						$data['saldo'],
						$data['tipo']
					)
				);

				return $consulta->fetch(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function actualizarMovimiento($data = [])
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

		public function eliminarMovimiento($id)
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
