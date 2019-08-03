namespace Ytake\Caerus\Traits;

use type DateTime;
use type Ytake\Caerus\Day;
use type Ytake\Caerus\{ExtendedDateTime, ExtendedDateTimeInterface};
use namespace HH\Lib\Str;
use function array_key_exists;

trait ModifierTrait {

  require extends ExtendedDateTime;

  protected static ImmMap<Day, string> $days = ImmMap{
    Day::MONDAY => 'Monday',
    Day::TUESDAY => 'Tuesday',
    Day::WEDNESDAY => 'Wednesday',
    Day::THURSDAY => 'Thursday',
    Day::FRIDAY => 'Friday',
    Day::SATURDAY => 'Saturday',
    Day::SUNDAY => 'Sunday',
  };

  protected static Day $weekStartsAt = Day::MONDAY;

  protected static Day $weekEndsAt = Day::SUNDAY;

  public static function getWeekStartsAt(): Day {
    return static::$weekStartsAt;
  }

  public static function setWeekStartsAt(
    Day $day
  ): void {
    static::$weekStartsAt = $day;
  }

  public static function getWeekEndsAt(): Day {
    return static::$weekEndsAt;
  }

  public static function setWeekEndsAt(
    Day $day): void {
    static::$weekEndsAt = $day;
  }

  public function setDate(
    int $year,
    int $month,
    int $day
  ): ExtendedDateTime {
    return $this->modify('+0 day')
      ->setDateParent($year, $month, $day);
  }

  private function setDateParent(
    int $year,
    int $month,
    int $day
  ): ExtendedDateTime {
    return parent::setDate($year, $month, $day);
  }

  public function setDateTime(
    int $year,
    int $month,
    int $day,
    int $hour,
    int $minute,
    int $second = 0
  ): ExtendedDateTime {
    return $this->setDate($year, $month, $day)->setTime($hour, $minute, $second);
  }

  public function setTimeFromTimeString(
    string $time
  ): ExtendedDateTime {
    $time = Str\split(":", $time);
    $hour = $time[0];
    $minute = array_key_exists(1, $time) ? $time[1] : 0;
    $second = array_key_exists(2, $time) ? $time[2] : 0;
    return $this->setTime((int) $hour, (int) $minute, (int) $second);
  }

  public function timestamp(int $value): ExtendedDateTime {
    return $this->setTimestamp($value);
  }

  public function year(int $value): ExtendedDateTime {
    return $this->setDate($value, $this->month, $this->day);
  }

  public function month(int $value): ExtendedDateTime {
    return $this->setDate($this->year, $value, $this->day);
  }

  public function day(int $value): ExtendedDateTime {
    return $this->setDate($this->year, $this->month, $value);
  }

  public function hour(int $value): ExtendedDateTime {
    return $this->setTime($value, $this->minute, $this->second);
  }

  public function minute(int $value): ExtendedDateTime {
    return $this->setTime($this->hour, $value, $this->second);
  }

  public function second(int $value): ExtendedDateTime {
    return $this->setTime($this->hour, $this->minute, $value);
  }

  public function addYears(int $value): ExtendedDateTime {
    return $this->modify((int)$value . ' year');
  }

  public function addYear(int $value = 1): ExtendedDateTime {
    return $this->addYears($value);
  }
}
