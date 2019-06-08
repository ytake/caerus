namespace Ytake\Caerus;

use type DateInterval;
use type InvalidArgumentException;
use function intval;
use function floor;

<<__ConsistentConstruct>>
class Interval extends DateInterval {

  public num $dayz = 0;
  public int $years = 1;
  public int $months = 0;
  public int $weeks = 0;
  public int $hours = 0;
  public int $minutes = 0;
  public int $seconds = 0;

  // @see https://github.com/facebook/hhvm/blob/master/hphp/runtime/base/datetime.cpp#L143
  const int HHVM_DAYS_FALSE = -99999;

  protected static function wasCreatedFromDiff(
    DateInterval $interval
  ): bool {
    return ($interval->days !== false && $interval->days !== static::HHVM_DAYS_FALSE);
  }

  public function __construct(
    int $years = 1,
    int $months = 0,
    int $weeks = 0,
    int $days = 0,
    int $hours = 0,
    int $minutes = 0,
    int $seconds = 0
  ) {
    $spec = Period::PREFIX;
    $spec .= $years > 0 ? $years . Period::YEARS : '';
    $spec .= $months > 0 ? $months . Period::MONTHS : '';
    $specDays = 0;
    $specDays += $weeks > 0 ? $weeks * NumberOf::DAYS_PER_WEEK : 0;
    $specDays += $days > 0 ? $days : 0;
    $spec .= ($specDays > 0) ? $specDays . Period::DAYS : '';

    if ($spec === Period::PREFIX) {
      $spec .= '0' . Period::YEARS;
    }
    if ($hours > 0 || $minutes > 0 || $seconds > 0) {
      $spec .= Period::TIME_PREFIX;
      $spec .= $hours > 0 ? $hours . Period::HOURS : '';
      $spec .= $minutes > 0 ? $minutes . Period::MINUTES : '';
      $spec .= $seconds > 0 ? $seconds . Period::SECONDS : '';
    }
    parent::__construct($spec);
    $this->dayz = $this->d;
    $this->years = $this->y;
    $this->months = $this->m;
    $this->hours = $this->h;
    $this->minutes = $this->i;
    $this->seconds = $this->s;
    $this->weeks = intval(floor($this->d / NumberOf::DAYS_PER_WEEK));
  }

  public static function create(
    int $years = 1, 
    int $months = 0,
    int $weeks = 0,
    int $days = 0,
    int $hours = 0,
    int $minutes = 0,
    int $seconds = 0
  ): this {
    return new static($years, $months, $weeks, $days, $hours, $minutes, $seconds);
  }

  public static function instance(
    DateInterval $di
  ): this {
    if (static::wasCreatedFromDiff($di)) {
      throw new InvalidArgumentException(
        "Can not instance a DateInterval object created from DateTime::diff()."
      );
    }
    $instance = new static($di->y, $di->m, 0, $di->d, $di->h, $di->i, $di->s);
    $instance->invert = $di->invert;
    $instance->days = $di->days;
    return $instance;
  }

  public function weeksAndDays(
    int $weeks,
    int $days
  ): this {
    $this->dayz = ($weeks * NumberOf::DAYS_PER_WEEK) + $days;
    return $this;
  }

   public function add(
     DateInterval $interval
  ): this {
    $sign = ($interval->invert === 1) ? -1 : 1;
    if (static::wasCreatedFromDiff($interval)) {
      $idays = $interval->days;
      $idays as int;
      $this->dayz = $this->dayz + ($idays * $sign);
      return $this;
    }
    $this->years = $this->years + ($interval->y * $sign);
    $this->months = $this->months + ($interval->m * $sign);
    $this->dayz = $this->dayz + ($interval->d * $sign);
    $this->hours = $this->hours + ($interval->h * $sign);
    $this->minutes = $this->minutes + ($interval->i * $sign);
    $this->seconds = $this->seconds + ($interval->s * $sign);
    return $this;
  }

  // Not Supported __callStatic method in HHVM/Hack.
}
