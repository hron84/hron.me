<?php

namespace Portfolio\Repository;

class ProjectRepository {
  /**
   * @var PDO
   */
  protected $pdo;

  protected static $tableName = 'projects';

  protected static $primaryKey = 'id';

  public function __construct(\PDO $pdo) {
    $this->pdo = $pdo;
  }

  public function find($id) {
    $query = 'SELECT * FROM ' . self::$tableName . ' WHERE ' . self::$primaryKey . ' = :id LIMIT 1';
    $stmt = $this->query($query, [':id' => $id]);
    return $stmt->fetch(\PDO::FETCH_ASSOC);
  }

  public function findAll($offset, $size) {
    $query = "SELECT * FROM " . self::$tableName . " LIMIT {$size} OFFSET {$offset}";
    $stmt = $this->query($query);
    return $this->mapAll($stmt->fetchAll(\PDO::FETCH_ASSOC));
  }

  protected function query($query, $variables) {
    $stmt = $this->pdo->prepare($sql);
    $stmt->execute($variables);
    return $stmt;
  }

  private function mapAll($result) {
    $collection = [];
    foreach($result as $row) {
      $collection[] = new Project($row);
    }

    return $collection;
  }
}
