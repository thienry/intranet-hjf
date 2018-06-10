<?php

namespace Thiago\Model;

use \Thiago\DB\Sql;
use \Thiago\Model;

class Post extends Model {

    public static function listAll() {

        $sql = new Sql();

        return $sql->select("SELECT * FROM tb_posts");

    }

    public static function checkList($list) {

        foreach ($list as &$row) {

            $p = new Post();
			$p->setData($row);
			$row = $p->getValues();

        }

        return $list;

    }

    public function save() {

        $sql = new Sql();

        $results = $sql->select("CALL sp_posts_save(:idpost, :titulo, :autor, :texto, :id_user)", array(
            ":idpost"=>$this->getidpost(),
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

    public function checkPhoto() {

        if (file_exists($_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR."res".DIRECTORY_SEPARATOR."site".DIRECTORY_SEPARATOR."img".DIRECTORY_SEPARATOR."posts".DIRECTORY_SEPARATOR.$this->getidpost().".jpg")) {

            $url = "/res/site/img/posts/".$this->getidpost().".jpg";

        } else {

            $url = "/res/site/img/post.jpg";

        }

        return $this->setdesphoto($url);

    }

    public function getValues() {

        $this->checkPhoto();

        $values = parent::getValues();

        return $values;

    }
   
    public function setPhoto($file) {

        $extension = explode('.', $file['name']);

        $extension = end($extension);

        switch ($extension) {
            
            case 'jpg':
            case 'jpeg':
                $image = imagecreatefromjpeg($file['tmp_name']);
                break;
            
            case 'gif':
                $image = imagecreatefromgif($file['tmp_name']);
                break;

            case 'png':
                $image = imagecreatefrompng($file['tmp_name']);
                break;

        }

        $dist = $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR."res".DIRECTORY_SEPARATOR."site".DIRECTORY_SEPARATOR."img".DIRECTORY_SEPARATOR."posts".DIRECTORY_SEPARATOR.$this->getidpost().".jpg";

        imagejpeg($image, $dist);

        imagedestroy($image);

        $this->checkPhoto();

    }

    public function getPostsPage($page = 1, $itemsPerPage = 8) {

        $start = ($page-1) * $itemsPerPage;

        $sql = new Sql();

        $results = $sql->select("SELECT SQL_CALC_FOUND_ROWS * FROM tb_posts ORDER BY idpost DESC LIMIT $start, $itemsPerPage");

        $resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal");

        return [
            'data'=>Post::checkList($results),
            'total'=>(int)$resultTotal[0]["nrtotal"],
            'pages'=>ceil($resultTotal[0]["nrtotal"] / $itemsPerPage)
        ];

    }

    public function getFromURL($idpost, $titulo)	{

        $sql = new Sql();
        
		$rows = $sql->select("SELECT * FROM tb_posts WHERE idpost = :idpost AND titulo = :titulo", [
            ':idpost'=>$idpost,
            ':titulo'=>$titulo
        ]);
        
        if (count($rows) > 0) {
            
            return $this->setData($rows[0]);

        } else {

            header("Location: /blog");
            exit;

        }
            
    }
    
    public static function getPostsTotals() {

        $sql = new Sql();

        $results = $sql->select("SELECT COUNT(*) as nrqtd FROM tb_posts");

        if (count($results) > 0) {
            
            return $results[0];

        } else {

            return [];

        }

    }

    public static function listAllLimit() {

        $sql = new Sql();

        return $sql->select("SELECT * FROM tb_posts ORDER BY idpost DESC LIMIT 8");

    }


    public static function listAllLimit2() {

        $sql = new Sql();

        return $sql->select("SELECT * FROM tb_posts ORDER BY idpost DESC LIMIT 3");

    }
}

?>