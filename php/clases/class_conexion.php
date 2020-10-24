<?php

	class Conexion{

		private $link;

		public function __construct(){
			$this->establecerConexion();			
		}

		public function establecerConexion(){
			$this->link = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT);

			if (!$this->link){
				echo '{"res":"fail","mensaje":"No se puede conectar a la base de datos."}';
				exit;
			}
		}

		public function cerrarConexion(){
			mysqli_close($this->link);
		}

		public function ejecutarInstruccion($sql){
			return mysqli_query($this->link, $sql);
		}

		public function obtenerFila($resultado){
			return mysqli_fetch_array($resultado);
		}

		public function liberarResultado($resultado){
			mysqli_free_result($resultado);
		}

		public function cantidadRegistros($resultado){
			return mysqli_num_rows($resultado);
		}

		public function getUsuario(){
			return $this->usuario;
		}
		public function setUsuario($usuario){
			$this->usuario = $usuario;
		}
		public function getContrasena(){
			return $this->contrasena;
		}
		public function setContrasena($contrasena){
			$this->contrasena = $contrasena;
		}
		public function getHost(){
			return $this->host;
		}
		public function setHost($host){
			$this->host = $host;
		}
		public function getBaseDatos(){
			return $this->baseDatos;
		}
		public function setBaseDatos($baseDatos){
			$this->baseDatos = $baseDatos;
		}
		public function getPuerto(){
			return $this->puerto;
		}
		public function setPuerto($puerto){
			$this->puerto = $puerto;
		}
		public function getLink(){
			return $this->link;
		}
		public function setLink($link){
			$this->link = $link;
		}

	}
?>