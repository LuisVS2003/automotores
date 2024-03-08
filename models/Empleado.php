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
				$consulta = $this->conexion->prepare('CALL listarEmpleados();');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarEmpleado($data = [])
		{
			try {
				$consulta = $this->conexion->prepare('CALL registrarEmpleado(?,?,?,?,?,?,?,?);');
				$consulta->execute(
					array(
						$data['rol_id'],
						$data['nombres'],
						$data['apellidos'],
						$data['dni'],
						$data['correo'],
						$data['clave'],
						$data['direccion'],
						$data['salario']
					)
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
