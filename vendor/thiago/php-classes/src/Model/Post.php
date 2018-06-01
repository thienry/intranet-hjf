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

        $results = $sql->select("CALL sp_posts_save(:titulo, :autor, :texto, :id_user)", array(
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

    public function update() {

        $sql = new Sql();

        $results = $sql->select("CALL sp_postsupdate_save(, :titulo, :autor, :texto, :id_user)", array(
            
            ":titulo"=>$this->gettitulo(),
            ":autor"=>$this->getautor(),
            ":texto"=>$this->gettexto(),
            ":id_user"=>$this->getid_user()
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

        $dist = $_SERVER['DOCUMENT_ROOT'].DIRECTORY_SEPARATOR."res".DIRECTORY_SEPARATOR."site".DIRECTORY_SEPARATOR."img".DIRECTORY_SEPARATOR."posts".DIRECTORY_SEPARATOR.$this->getidproduct().".jpg";

        imagejpeg($image, $dist);

        imagedestroy($image);

        $this->checkPhoto();

    }

}

?>