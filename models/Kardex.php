	<?php

	require_once 'Conexion.php';

	class Kardex extends Conexion
	{
		private $conexion;

		public function __construct()
		{
			$this->conexion = parent::getConexion();
		}

		public function listarKardex()
		{
			try {
				$consulta = $this->conexion->prepare('CALL spu_kardex_listar()');
				$consulta->execute();

				return $consulta->fetchAll(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function registrarKardex($data = [])
		{
			try {
				$consulta = $this->conexion->prepare('CALL registrarKardex(?,?,?,?)');
				$consulta->execute(
					array(
						$data['producto_id'],
						$data['almacen_id'],
						$data['minimo'],
						$data['maximo']
					)
				);

				return $consulta->fetch(PDO::FETCH_ASSOC);
			} catch (Exception $e) {
				die($e->getMessage());
			}
		}

		public function actualizarKardex($data = [])
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

		public function eliminarKardex($id)
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
