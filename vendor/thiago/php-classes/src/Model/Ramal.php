<?php

namespace Thiago\Model;

use \Thiago\DB\Sql;
use Thiago\Model;

class Ramal extends Model {

    public static function listAll() {
        $sql = new Sql();
        return $sql->select("SELECT * FROM tb_ramais ORDER BY setor");
    }

    public function save() {
        $sql = new Sql();
        $results = $sql->select("CALL sp_ramais_save(:setor, :ramal, :colaborador)", array(
            ":setor"=>$this->getsetor(),
            ":ramal"=>$this->getramal(),
            ":colaborador"=>$this->getcolaborador()
        ));
        $this->setData($results[0]);
    }

    public function get($idramal) {
        $sql = new Sql();
        $results = $sql->select("SELECT * FROM tb_ramais WHERE id_agenda = :id_agenda", array(
            ":id_agenda"=>$idramal
        ));
        $data = $results[0];
        $this->setData($data);
    }

    public function delete() {
        $sql = new Sql();
        $sql->query("CALL sp_ramais_delete(:id_agenda)", array(
            ":id_agenda"=>$this->getid_agenda()
        ));
    }

    public function update() {
        $sql = new Sql();
        $results = $sql->select("CALL sp_ramaisupdate_save(:id_agenda, :setor, :ramal, :colaborador)", array(
            ":id_agenda"=>$this->getid_agenda(),
            ":setor"=>$this->getsetor(),
            ":ramal"=>$this->getramal(),
            ":colaborador"=>$this->getcolaborador()
        ));
        $this->setData($results[0]);
    }

}

?>