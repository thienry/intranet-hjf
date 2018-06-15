<?php 

namespace Thiago\DB;

class Sql {

	const HOSTNAME = "us-cdbr-iron-east-04.cleardb.net";
	const USERNAME = "b41bf7bc49a310";
	const PASSWORD = "0f22a157a1890a8";
	const DBNAME = "heroku_ed0d2e3a8c59395";
	const CHARSET = "utf8";

	private $conn;

	public function __construct()
	{

		$this->conn = new \PDO(
			"mysql:dbname=".Sql::DBNAME.";host=".Sql::HOSTNAME.";charset=".Sql::CHARSET, 
			Sql::USERNAME,
			Sql::PASSWORD			
		);

	}

	private function setParams($statement, $parameters = array())
	{

		foreach ($parameters as $key => $value) {
			
			$this->bindParam($statement, $key, $value);

		}

	}

	private function bindParam($statement, $key, $value)
	{

		$statement->bindParam($key, $value);

	}

	public function query($rawQuery, $params = array())
	{

		$stmt = $this->conn->prepare($rawQuery);

		$this->setParams($stmt, $params);

		$stmt->execute();

	}

	public function select($rawQuery, $params = array()):array
	{

		$stmt = $this->conn->prepare($rawQuery);

		$this->setParams($stmt, $params);

		$stmt->execute();

		return $stmt->fetchAll(\PDO::FETCH_ASSOC);

	}

}

?>