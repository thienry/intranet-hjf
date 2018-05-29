<?php

namespace Thiago\Model;

use \Thiago\DB\Sql;
use \Thiago\Model;

class Post extends Model {

    public static function listAll() {

        $sql = new Sql();

        return $sql->select("SELECT * FROM tb_posts");

    }

    public function save() {

        $sql = new Sql();

        $results = $sql->select("CALL sp_posts_save( :titulo, :autor, :texto, :id_user)", array(
            ":titulo"=>$this->gettitulo(),
            ":autor"=>$this->getautor(),
            ":texto"=>$this->gettexto(),
            ":id_user"=>$this->getid_user()
        ));

        $this->setData($results[0]);

    }

    public function get($idpost) {

        $sql = new Sql();

        $results = $sql->select("SELECT * FROM tb_posts WHERE idpost = :idpost", array(
            'idpost'=>$idpost
        ));

        $this->setData($results[0]);

    }

    public function delete() {

        $sql = new Sql();

        $sql->query("DELETE FROM tb_posts WHERE idpost = :idpost", [
            ":idpost"=>$this->getidpost()
        ]);

    }
   
}

?>