<?php

namespace Portfolio\Repository;

use \Portfolio\Model\Company;

class CompanyRepository {
  /**
   * @var PDO
   */
  protected $pdo;

  protected static $tableName = 'companies';

  protected static $primaryKey = 'id';

  public function __construct(\PDO $pdo) {
    $this->pdo = $pdo;
  }

  public function find($id) {
    $query = 'SELECT * FROM ' . self::$tableName . ' WHERE ' . self::$primaryKey . ' = :id LIMIT 1';
    $stmt = $this->query($query, [':id' => $id]);
    return $stmt->fetch(\PDO::FETCH_ASSOC);
  }

  public function findAll($offset = 0, $size = 25) {
    $query = "SELECT * FROM " . self::$tableName . " LIMIT {$size} OFFSET {$offset}";
    $stmt = $this->query($query);
    return $this->mapAll($stmt->fetchAll(\PDO::FETCH_ASSOC));
  }

  protected function query($query, $variables = null) {
    if(is_null($variables)) {
      $variables = [];
    }

    $stmt = $this->pdo->prepare($query);
    $stmt->execute($variables);
    return $stmt;
  }

  private function mapAll($result) {
    $collection = [];
    foreach($result as $row) {
      $collection[] = new Company($row);
    }

    return $collection;
  }
}
