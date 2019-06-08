namespace Ytake\Caerus;

use type DateInterval;
use type Ytake\Caerus\Unit;
use type Ytake\Caerus\NumberOf;

class DifferenceFormatter {

  private dict<Unit, DiffString> $toPlural = dict[
    Unit::YEAR => DiffString::YEAR_PLURAL,
    Unit::MONTH => DiffString::MONTH_PLURAL,
    Unit::DAY => DiffString::DAY_PLURAL,
    Unit::WEEK => DiffString::WEEK_PLURAL,
    Unit::HOUR => DiffString::HOUR_PLURAL,
    Unit::MINUTE => DiffString::MINUITE_PLURAL,
    Unit::SECOND => DiffString::SECOND_PLURAL,
  ];

  public function __construct(
    protected Translator $translate = new Translator()
  ) {}

  public function diffForHumans(
    ExtendedDateTimeInterface $date,
    ?ExtendedDateTimeInterface $other = null,
    bool $absolute = false
  ): string {
    $isNow = $other === null;
    if ($isNow) {
      $other = $date::now($date->getTimezone());
    }
    invariant($other is nonnull, 'error');
    $diffInterval = $this->getDiffInterval($date, $other);
    switch (true) {
      case ($diffInterval->y > 0):
        $unit = Unit::YEAR;
        $count = $diffInterval->y;
        break;
      case ($diffInterval->m > 0):
        $unit = Unit::MONTH;
        $count = $diffInterval->m;
        break;
      case ($diffInterval->d > 0):
        $unit = Unit::DAY;
        $count = $diffInterval->d;
        if ($count >= NumberOf::DAYS_PER_WEEK) {
          $unit = Unit::WEEK;
          $count = (int)($count / NumberOf::DAYS_PER_WEEK);
        }
        break;
      case ($diffInterval->h > 0):
        $unit = Unit::HOUR;
        $count = $diffInterval->h;
        break;
      case ($diffInterval->i > 0):
        $unit = Unit::MINUTE;
        $count = $diffInterval->i;
        break;
      default:
        $count = $diffInterval->s;
        $unit = Unit::SECOND;
        break;
    }
    $time = $this->translate->plural(
      $this->toPlural[$unit],
      $count,
      dict['count' => $count]
    );
    if ($absolute) {
      return $time;
    }
    $isFuture = $diffInterval->invert === 1;
    $transId = $isNow ? ($isFuture ? 'from_now' : 'ago') : ($isFuture ? 'after' : 'before');
    $tryKeyExists = $unit . '_' . $transId;
    if ($this->translate->exists($tryKeyExists)) {
      $time = $this->translate->plural(
        DiffString::assert($tryKeyExists),
        $count,
        dict['count' => $count]
      );
    }
    if(DiffString::isValid($transId)) {
      return $this->translate->singular(
        DiffString::assert($transId),
        dict['time' => $time]
      );
    }
    return '';
  }

  protected function getDiffInterval(
    ExtendedDateTimeInterface $date,
    ExtendedDateTimeInterface $other
  ): DateInterval {
    $diffInterval = $date->diff($other);
    invariant($diffInterval is DateInterval, 'error no DateInterval class');
    return $diffInterval;
  }
}
