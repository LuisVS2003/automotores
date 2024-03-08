	<?php

	require_once 'Conexion.php';

	class Proveedor extends Conexion
	{
		private $conexion;

		public function __construct()
		{
			$this->conexion = parent::getConexion();
		}

		public function listarProveedor()
		{
			try {
				$consulta = $this->conexion->prepare('CALL listarProveedores()');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarProveedor($data = [])
		{
			try {
				$consulta = $this->conexion->prepare('CALL registrarProveedor(?,?,?,?,?)');
				$consulta->execute(
					array(
						$data['nombre'],
						$data['telefono'],
						$data['correo'],
						$data['ruc'],
						$data['direccion']
					)
				);

				return $consulta->fetch(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function actualizarProveedor($data = [])
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

		public function eliminarProveedor($id)
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
