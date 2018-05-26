<?php

namespace Thiago;

use Thiago\DB\Sql;
use Thiago\Model;


class Ramal extends Model {

    public static function listAll() {

        $sql = new Sql();

        return $sql->select("SELECT * FROM tb_ramais ORDER BY setor");

    }

}

?>