namespace Ytake\Caerus;

use type DateTimeImmutable;

<<__ConsistentConstruct>>
abstract class ExtendedDateTime extends DateTimeImmutable {

  protected static string $toStringFormat = 'Y-m-d';

  public function addYears(
    int $value
  ): ExtendedDateTime {
    return $this->modify((int) $value . ' year');
  }
}
