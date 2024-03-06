	<?php

	require_once 'Conexion.php';

	class Empleado extends Conexion
	{
		private $conexion;

		public function __construct()
		{
			$this->conexion = parent::getConexion();
		}

		public function listarEmpleado()
		{
			try {
				$consulta = $this->conexion->prepare('');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarEmpleado($data = [])
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

		public function actualizarEmpleado($data = [])
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

		public function eliminarEmpleado($id)
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
