namespace Ytake\Caerus;

use type DateTimeImmutable;
use type DateTimeInterface;

<<__ConsistentConstruct>>
abstract class ExtendedDateTime extends DateTimeImmutable {

  protected int $year = 0;
  protected int $yearIso = 0;
  protected int $month = 0;
  protected int $day = 0;
  protected int $hour = 0;
  protected int $minute = 0;
  protected int $second = 0;
  protected int $timestamp = 0;

  protected static string $toStringFormat = 'Y-m-d';

  public function addYears(
    int $value
  ): ExtendedDateTime {
    return $this->modify((int) $value . ' year');
  }

  abstract public static function instance(
    DateTimeInterface $dt
  ): ExtendedDateTime;
}
