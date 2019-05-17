namespace Ytake\Hurry;

use DateTimeImmutable;
use DateTimeZone;

class Hurry extends DateTimeImmutable implements ExtendedDateTimeInterface {

  protected string $toStringFormat = ExtendedDateTimeInterface::DEFAULT_TO_STRING_FORMAT;
}
