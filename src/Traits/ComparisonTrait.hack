namespace Ytake\Caerus\Traits;

use type DateTime;
use type Ytake\Caerus\Day;
use type Ytake\Caerus\{ExtendedDateTime, ExtendedDateTimeInterface};

trait ComparisonTrait {
  use MemoryTrait;

  protected Vector<Day> $weekendDays = Vector{
    Day::SATURDAY,
    Day::SUNDAY
  };

  public function getWeekendDays(): Vector<Day> {
    return $this->weekendDays;
  }

  public function setWeekendDays(
    Vector<Day> $days
  ): void {
    $this->weekendDays = $days;
  }

  public function eq(
    ExtendedDateTimeInterface $dt
  ): bool {
    return $this === $dt;
  }

  public function ne(
    ExtendedDateTimeInterface $dt
  ): bool{
    return !$this->eq($dt);
  }
}
