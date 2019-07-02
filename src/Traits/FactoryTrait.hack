namespace Ytake\Caerus\Traits;

use type Ytake\Caerus\ExtendedDateTime;
use type DateTimeZone;
use type DateTimeInterface;
use type InvalidArgumentException;
use namespace HH\Lib\{C, Str};
use function date;
use function date_default_timezone_get;
use const PHP_EOL;

trait FactoryTrait {
  require extends ExtendedDateTime;

  protected static dict<arraykey, mixed> $lastErrors = dict[];

  public static function getLastErrors(
  ): dict<arraykey, mixed> {
    if (!C\count(static::$lastErrors)) {
      return dict(parent::getLastErrors());
    }
    return static::$lastErrors;
  }

  public static function instance(
    DateTimeInterface $dt
  ): ExtendedDateTime {
    if ($dt is ExtendedDateTime) {
      return clone $dt;
    }
    return new static($dt->format('Y-m-d H:i:s.u'), $dt->getTimezone());
  }

  public static function parse(
    string $time = 'now',
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return new static($time, $tz);
  }

  public static function now(
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return new static('now', $tz);
  }

  public static function today(
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return new static('midnight', $tz);
  }

  public static function tomorrow(
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return new static('tomorrow, midnight', $tz);
  }

  public static function yesterday(
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return new static('yesterday, midnight', $tz);
  }

  public static function create(
    ?int $year = null,
    ?int $month = null,
    ?int $day = null,
    ?int $hour = null,
    ?int $minute = null,
    ?int $second = null,
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    $year = (!$year is nonnull) ? date('Y') : $year;
    $month = (!$month is nonnull) ? date('n') : $month;
    $day = (!$day is nonnull) ? date('j') : $day;
    if (!$hour is nonnull) {
      $hour = date('G');
      $minute = (!$minute is nonnull) ? date('i') : $minute;
      $second = (!$second is nonnull) ? date('s') : $second;
    } else {
      $minute = (!$minute is nonnull) ? 0 : $minute;
      $second = (!$second is nonnull) ? 0 : $second;
    }
    $instance = static::createFromFormat(
      'Y-n-j G:i:s',
      Str\format('%d-%d-%d %d:%02d:%02d', 0, $month, $day, $hour, $minute, $second),
      $tz
    );
    return $instance->addYears($year);
  }

  public static function createFromDate(
    ?int $year = null,
    ?int $month = null,
    ?int $day = null,
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return static::create($year, $month, $day, null, null, null, $tz);
  }

  public static function createFromTime(
    ?int $hour = null,
    ?int $minute = null,
    ?int $second = null,
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return static::create(null, null, null, $hour, $minute, $second, $tz);
  }

  public static function createFromFormat(
    string $format,
    string $time,
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    $dt = parent::createFromFormat($format, $time);
    if ($tz is nonnull) {
      $dt = parent::createFromFormat($format, $time, static::safeCreateDateTimeZone($tz));
    }
    $errors = parent::getLastErrors();
    if ($dt === false) {
      throw new InvalidArgumentException(
        Str\join($errors['errors'], PHP_EOL)
      );
    }
    $dt = static::instance($dt);
    static::$lastErrors = dict($errors);
    return $dt;
  }

  public static function createFromTimestamp(
    int $timestamp,
    ?DateTimeZone $tz = null
  ): ExtendedDateTime {
    return static::now($tz)->setTimestamp($timestamp);
  }

  public static function createFromTimestampUTC(
    int $timestamp
  ): ExtendedDateTime {
    return new static('@' . $timestamp);
  }

  protected static function safeCreateDateTimeZone(
    mixed $object
  ): DateTimeZone {
    if (!$object is nonnull) {
      return new DateTimeZone(date_default_timezone_get());
    }
    if ($object is DateTimeZone) {
      return $object;
    }
    return new DateTimeZone((string) $object);
  }
}
