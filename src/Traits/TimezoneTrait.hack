namespace Ytake\Caerus\Traits;

use type DateTimeZone;
use type DateTimeImmutable;
use type Ytake\Caerus\ExtendedDateTimeInterface;
use type Ytake\Caerus\Exception\InvalidArgumentTypeException;
use function date_default_timezone_get;
use function strval;

trait TimezoneTrait {
  require implements ExtendedDateTimeInterface;
  require extends DateTimeImmutable;

  public function timezone(dynamic $value): this {
    if($value is DateTimeZone || $value is string) {
      return $this->setTimezone($value);
    }
    throw new InvalidArgumentTypeException(
      'The argument must be a string or a DateTimeZone type'
    );
  }

  public function tz(
    dynamic $value
  ): this {
    return $this->setTimezone($value);
  }

  public function setTimezone(
    dynamic $value
  ): this {
    $date = parent::setTimezone(static::safeCreateDateTimeZone($value));
    $date->getTimestamp();
    return $date;
  }

  protected static function safeCreateDateTimeZone(
    dynamic $object
  ): DateTimeZone {
    if ($object === null) {
      return new DateTimeZone(date_default_timezone_get());
    }
    if ($object is DateTimeZone) {
      return $object;
    }
    return new DateTimeZone(strval($object));
  }
}
