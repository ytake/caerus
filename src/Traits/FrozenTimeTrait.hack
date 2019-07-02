namespace Ytake\Caerus\Traits;

use type DateInterval;
use type DateTimeZone;
use type DateTimeInterface;
use type Ytake\Caerus\{ExtendedDateTime, ExtendedDateTimeInterface};
use type Ytake\Caerus\Exception\InvalidArgumentTypeException;
use namespace HH\Lib\{Regex, Str};
use function gmdate;
use function ctype_digit;
use function date;
use function strtotime;

trait FrozenTimeTrait {
  require extends ExtendedDateTime;
  require implements ExtendedDateTimeInterface;

  use RelativeKeywordTrait;

  protected function stripTime(
    mixed $time
  ): string {
    if ($time is int || ctype_digit($time)) {
      return gmdate('Y-m-d 00:00:00', (int) $time);
    }
    if ($time is DateTimeInterface) {
      $time = $time->format('Y-m-d 00:00:00');
    }
    if ($time is string) {
      if (Str\slice($time, 0, 1) === '@') {
        return gmdate('Y-m-d 00:00:00', (int) Str\slice($time, 1));
      }
      if (Str\is_empty($time) || $time === 'now') {
        return date('Y-m-d 00:00:00');
      }
      if ($this::hasRelativeKeywords($time)) {
        return date('Y-m-d 00:00:00', strtotime($time));
      }
      return Regex\replace($time, re"/\d{1,2}:\d{1,2}:\d{1,2}(?:\.\d+)?/", '00:00:00');
    }
    throw new InvalidArgumentTypeException("the argument is not the expected type");
  }

  protected function stripRelativeTime(
    string $time
  ): string {
    return Regex\replace(
      $time, re"/([-+]\s*\d+\s(?:minutes|seconds|hours|microseconds))/", ''
    );
  }

  public function setTime(
    int $_,
    int $_,
    ?int $_ = null,
    ?int $_ = null
  ): ExtendedDateTime {
    return parent::setTime(0, 0, 0);
  }

  public function add(
    DateInterval $interval
  ): ExtendedDateTime {
    return parent::add($interval)->setTime(0, 0, 0);
  }

  public function sub(
    DateInterval $interval
  ): ExtendedDateTime {
    return parent::sub($interval)->setTime(0, 0, 0);
  }

  public function timezone(
    DateTimeZone $_
  ): ExtendedDateTime {
    return $this;
  }

  public function tz(
    DateTimeZone $_
  ): ExtendedDateTime {
    return $this;
  }

  public function setTimezone(
    DateTimeZone $_
  ): ExtendedDateTime {
    return $this;
  }

  public function setTimestamp(
    int $value
  ): ExtendedDateTime {
    return parent::setTimestamp($value)->setTime(0, 0, 0);
  }

  public function modify(
    string $relative
  ): ExtendedDateTime {
    if (Regex\matches($relative, re"/hour|minute|second/")) {
      return $this;
    }
    $new = parent::modify($relative);
    if ($new->format('H:i:s') !== '00:00:00') {
      return $new->setTime(0, 0, 0);
    }
    return $new;
  }
}
