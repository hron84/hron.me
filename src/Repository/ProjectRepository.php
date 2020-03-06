<?php

namespace Portfolio\Repository;

use \Portfolio\Model\Project;

class ProjectRepository {
  /**
   * @var PDO
   */
  protected $pdo;

  /**
   * @var \Psr\Log\LoggerInterface
   */
  protected $logger;

  protected static $tableName = 'projects';

  protected static $primaryKey = 'id';

  public function __construct(\PDO $pdo, \Psr\Log\LoggerInterface $logger) {
    $this->pdo = $pdo;
    $this->logger = $logger;
  }

  public function find($id) {
    $query = 'SELECT * FROM ' . self::$tableName . ' WHERE ' . self::$primaryKey . ' = :id LIMIT 1';
    $stmt = $this->query($query, [':id' => $id]);
    return $stmt->fetch(\PDO::FETCH_ASSOC);
  }

  public function findAll($offset = 0, $size = 25) {
    $query = "SELECT * FROM " . self::$tableName . " LIMIT {$size} OFFSET {$offset}";
    $this->logger->debug('Query: ' . $query);
    $stmt = $this->query($query);
    $result = $stmt->fetchAll();
    //print_r($result);
    return $this->mapAll($result);
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
      $collection[] = new Project($row);
    }

    return $collection;
  }
}
