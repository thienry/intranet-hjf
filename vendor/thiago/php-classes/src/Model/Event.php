<?php

namespace Thiago\Model;

use \Thiago\DB\Sql;
use \Thiago\Model;

class Event extends Model {

  public static function listAll()  {
    $sql = new Sql();
    return $sql->select("SELECT * FROM tb_events");
  }

  public static function checkList($list)  {
    foreach ($list as &$row) {
      $p = new Event();
      $p->setData($row);
      $row =  $p->getValues();
    }
    return $list;
  }

  public function save() {
    $sql = new Sql();
    $results = $sql -> select("CALL sp_events_save(:id_event, :name_event, :description_event, :id_user)", [
      ":id_event" => $this -> getid_event(),
      ":name_event" => $this -> getname_event(),
      ":description_event" => $this -> getdescription_event(),
      ":id_user" => $this -> getid_user()
    ]);
    $this -> setData($results[0]);
  }

  public function get($id_event) {
    $sql = new Sql();
    $results = $sql->select("SELECT * FROM tb_events WHERE id_event = :id_event", [
      "id_event" => $id_event
    ]);
    $this->setData($results[0]);
  }

  public function delete() {
    $sql = new Sql();
    $sql->query("DELETE FROM tb_events WHERE id_event = :id_event", [
      ":id_event" => $this->getid_event()
    ]);
  }

  public function getValues() {
    $this->checkPhoto();
    $values = parent::getValues();
    return $values;
  }
   
  public function setPhotos($files, $id_event) {
    $files = $_FILES["files"];
    $numFile = count(array_filter($files["name"]));

    if ($numFile > 0) {
      $sql = new Sql();
      $resultsExistPhotos = $sql -> select("SELECT * FROM tb_photos WHERE id_event = :id_event", [
        ":id_event" => $id_event
      ]);

      $timeStampNow = time();
      $countResultsPhotos = count($resultsExistPhotos);

      for ($i=0; $i < $countResultsPhotos ; $i++) { 
        if ($timeStampNow > $resultsExistPhotos[$i]["dt_photo"]) {
          $filename = $_SERVER["DOCUMENT_ROOT"] . 
            DIRECTORY_SEPARATOR . "res" .
            DIRECTORY_SEPARATOR . "site" .
            DIRECTORY_SEPARATOR . "img" .
            DIRECTORY_SEPARATOR . "events" .
            DIRECTORY_SEPARATOR . $resultsExistPhotos[$i]["id_event"] . "-" . 
            $resultsExistPhotos[$i]["id_photo"] . ".jpg";

          $resultsDeletedPhotos = $sql -> query("DELETE FROM tb_photos WHERE id_event = :id_event", [
            "id_event" => $resultsExistPhotos[$i]["id_event"]
          ]);
        }
      }


      for ($i=0; $i <= $numFile ; $i++) { 
        if (isset($files["name"][$i])) {
          $name = $files["name"][$i];

          $extension = explode(".", $name);
          $extension = end($extension);

          switch ($extension) {
            case 'jpg':
            case 'jpeg':
              $image = imagecreatefromjpeg($files["tmp_name"][$i]);
              break;

            case 'gif':
              $image = imagecreatefromgif($files["tmp_name"][$i]);
              break;
            
            case 'png':
              $image = imagecreatefrompng($files["tmp_name"][$i]);
              break;
          }

          $countImg = $i + 1;
          $namePhoto = $this -> getid_event() . "-" . $countImg . ".jpg";

          $dist = $_SERVER["DOCUMENT_ROOT"] .
            DIRECTORY_SEPARATOR . "res" .
            DIRECTORY_SEPARATOR . "site" .
            DIRECTORY_SEPARATOR . "img" .
            DIRECTORY_SEPARATOR . "events" .
            DIRECTORY_SEPARATOR . $namePhoto;

          imagejpeg($image, $dist);
          imagedestroy($image);

          $sql -> query("INSERT INTO tb_photos (id_photo, name_photo, id_event) VALUES (:id_photo, :name_photo, :id_event)", [
            ":id_photo" => $this -> getid_photo(),
            ":name_photo" => $namePhoto,
            ":id_event" => $this -> getid_event()
          ]);

          $this -> getPhotos();
        }
      }
    }

  }

  public function getPhotos() {
    $sql = new Sql();
    $resultsExistPhotos = $sql -> select("SELECT * FROM tb_photos WHERE id_event = :id_event", [
      ":id_event" => $this -> getid_event()
    ]);

    $countResultsPhotos = count($resultsExistPhotos);

    if ($countResultsPhotos > 0) {
      foreach ($resultsExistPhotos as &$result) {
        foreach ($result as $key => $value) {
          if ($key === "name_photo") {
            $result["desphoto"] = "/res/site/img/events/" . $result["name_photo"];
          }
        }
      }

      return $resultsExistPhotos;
    }
  }

  public function getFirstPhoto() {
    return $url = "/res/site/img/events" . $this -> getid_event() . "-" . 1 . ".jpg";
  }

  public function getEventsPage($page = 1, $itemsPerPage = 12) {
    $start = ($page-1) * $itemsPerPage;
    $sql = new Sql();
    $results = $sql->select("SELECT SQL_CALC_FOUND_ROWS * FROM tb_events ORDER BY id_event DESC LIMIT $start, $itemsPerPage");
    $resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal");
    return [
      'data'=>Event::checkList($results),
      'total'=>(int)$resultTotal[0]["nrtotal"],
      'pages'=>ceil($resultTotal[0]["nrtotal"] / $itemsPerPage),
    ];
  }

  public function getFromURL($id_event, $name_event)	{
    $sql = new Sql();
    $rows = $sql->select("SELECT * FROM tb_events WHERE id_event = :id_event AND name_event = :name_event", [
      ':id_event'=>$id_event,
      ':name_event'=>$name_event
    ]);
    if (count($rows) > 0) {
      return $this->setData($rows[0]);
    } else {
      header("Location: /events");
      exit;
    }
  }
    

}
