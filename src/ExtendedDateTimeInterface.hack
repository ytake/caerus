namespace Ytake\Caerus;

use type DateTimeInterface;
use type DateTimeZone;

interface ExtendedDateTimeInterface extends DateTimeInterface {

  const string DEFAULT_TO_STRING_FORMAT = 'Y-m-d H:i:s';

  public static function now(
    ?ExtendedDateTimeInterface $tz
  ): this;

  public function copy(): this;

  public function year(int $value): this;

  public function month(int $value): this;

  public function day(int $value): this;

  public function hour(int $value): this;

  public function minute(int $value): this;

  public function second(int $value): this;

  public function setDateTime(
    int $year,
    int $month,
    int $day,
    int $hour,
    int $minute,
    int $second = 0
  ): this;

  public function setTimeFromTimeString(
    string $time
  ): this;

  public function timestamp(
    int $value
  ): this;

  public function timezone(
    DateTimeZone $value
  ) :this;

  public function tz(
    DateTimeZone $value
  ) :this;

  public function setTimezone(
    DateTimeZone $value
  ) :this;

  public function toDateString(): string;

  public function toFormattedDateString(): string;

  public function toTimeString(): string;

  public function toDateTimeString(): string;

  public function toDayDateTimeString(): string;

  public function toAtomString(): string;

  public function toCookieString(): string;

  public function toIso8601String(): string;

  public function toRfc822String(): string;

  public function toRfc850String(): string;

  public function toRfc1036String(): string;

  public function toRfc1123String(): string;

  public function toRfc2822String(): string;

  public function toRfc3339String(): string;

  public function toRssString(): string;

  public function toW3cString(): string;

  public function eq(
    ExtendedDateTimeInterface $dt
  ): bool;

  public function ne(
    ExtendedDateTimeInterface $dt
  ): bool;

  public function gt(
    ExtendedDateTimeInterface $dt
  ): bool;

  public function gte(
    ExtendedDateTimeInterface $dt
  ): bool;

  public function lt(
    ExtendedDateTimeInterface $dt
  ): bool;

  public function lte(
    ExtendedDateTimeInterface $dt
  ): bool;

  /**
   * Determines if the instance is between two others
   */
  public function between(
    ExtendedDateTimeInterface $dt1,
    ExtendedDateTimeInterface $dt2,
    bool $equal = true
  ): bool;

  /**
   * Get the closest date from the instance.
   */
  public function closest(
    ExtendedDateTimeInterface $dt1,
    ExtendedDateTimeInterface $dt2
  ): this;

  /**
   * Get the farthest date from the instance.
   */
  public function farthest(
    ExtendedDateTimeInterface $dt1,
    ExtendedDateTimeInterface $dt2
  ): this;

  /**
   * Get the minimum instance between a given instance (default now) and the current instance.
   */
  public function min(
    ?ExtendedDateTimeInterface $dt = null
  ): this;

  /**
   * Get the maximum instance between a given instance (default now) and the current instance.
   */
  public function max(
    ?ExtendedDateTimeInterface $dt = null
  ): this;

  /**
   * Determines if the instance is a weekday
   */
  public function isWeekday(): bool;

  /**
   * Determines if the instance is a weekend day
   */
  public function isWeekend(): bool;

  /**
   * Determines if the instance is yesterday
   */
  public function isYesterday(): bool;

  /**
   * Determines if the instance is today
   */
  public function isToday(): bool;

  /**
   * Determines if the instance is tomorrow
   */
  public function isTomorrow(): bool;

  /**
   * Determines if the instance is in the future, ie. greater (after) than now
   */
  public function isFuture(): bool;

  /**
   * Determines if the instance is in the past, ie. less (before) than now
   */
  public function isPast(): bool;

  /**
   * Determines if the instance is a leap year
   */
  public function isLeapYear(): bool;

  /**
   * Checks if the passed in date is the same day as the instance current day.
   */
  public function isSameDay(
    ExtendedDateTimeInterface  $dt
  ): bool;

  public function isSunday(): bool;

  public function isMonday(): bool;

  public function isTuesday(): bool;

  public function isWednesday(): bool;

  public function isThursday(): bool;

  public function isFriday(): bool;

  public function isSaturday(): bool;

  public function isThisWeek(): bool;

  public function isThisMonth(): bool;

  public function isThisYear(): bool;

  public function addYears(int $value): ExtendedDateTimeInterface;

  public function addYear(int $value = 1): ExtendedDateTimeInterface;

  public function subYear(int $value = 1): ExtendedDateTimeInterface;

  public function subYears(int $value): ExtendedDateTimeInterface;

  public function addMonths(int $value): ExtendedDateTimeInterface;

  public function addMonth(int $value = 1): ExtendedDateTimeInterface;

  public function subMonth(int $value = 1): ExtendedDateTimeInterface;

  /**
   * Remove months from the instance
   */
  public function subMonths(int $value): ExtendedDateTimeInterface;

  public function addMonthsWithOverflow(int $value): ExtendedDateTimeInterface;

  public function addMonthWithOverflow(int $value = 1): ExtendedDateTimeInterface;

  public function subMonthWithOverflow(int $value = 1): ExtendedDateTimeInterface;

  public function subMonthsWithOverflow(int $value): ExtendedDateTimeInterface;

  public function addDays(int $value): ExtendedDateTimeInterface;

  public function addDay(int $value = 1): ExtendedDateTimeInterface;

  public function subDay(int $value = 1): ExtendedDateTimeInterface;

  public function subDays(int $value): ExtendedDateTimeInterface;

  public function addWeekdays(int $value): ExtendedDateTimeInterface;

  public function addWeekday(int $value = 1): ExtendedDateTimeInterface;

  public function subWeekday(int $value = 1): ExtendedDateTimeInterface;

  public function subWeekdays(int $value): ExtendedDateTimeInterface;

  public function addWeeks(int $value): ExtendedDateTimeInterface;

  public function addWeek(int $value = 1): ExtendedDateTimeInterface;

  public function subWeek(int $value = 1): ExtendedDateTimeInterface;

  public function subWeeks(int $value): ExtendedDateTimeInterface;

  public function addHours(int $value): ExtendedDateTimeInterface;

  public function addHour(int $value = 1): ExtendedDateTimeInterface;

  public function subHour(int $value = 1): ExtendedDateTimeInterface;

  public function subHours(int $value): ExtendedDateTimeInterface;

  public function addMinutes(int $value): ExtendedDateTimeInterface;

  public function addMinute(int $value = 1): ExtendedDateTimeInterface;

  public function subMinute(int $value = 1): ExtendedDateTimeInterface;

  public function subMinutes(int $value): ExtendedDateTimeInterface;

  public function addSeconds(int $value): ExtendedDateTimeInterface;

  public function addSecond(int $value = 1): ExtendedDateTimeInterface;

  public function subSecond(int $value = 1): ExtendedDateTimeInterface;

  public function subSeconds(int $value): ExtendedDateTimeInterface;

  public function diffForHumans(
    ?ExtendedDateTimeInterface $other = null,
    bool $absolute = false
  ): string;

  public function diffInYears(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInMonths(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInWeeks(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInDays(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

    /**
     * Get the difference in days using a filter callable
     *
     * @param callable $callback The callback to use for filtering.
     * @param \Cake\Chronos\ChronosInterface|null $dt The instance to difference from.
     * @param bool $abs Get the absolute of the difference
     * @return int
     */
    // public function diffInDaysFiltered(callable $callback, ChronosInterface $dt = null, $abs = true);

    /**
     * Get the difference in hours using a filter callable
     *
     * @param callable $callback The callback to use for filtering.
     * @param \Cake\Chronos\ChronosInterface|null $dt The instance to difference from.
     * @param bool $abs Get the absolute of the difference
     * @return int
     */
    // public function diffInHoursFiltered(callable $callback, ChronosInterface $dt = null, $abs = true);

    /**
     * Get the difference by the given interval using a filter callable
     *
     * @param \Cake\Chronos\ChronosInterval $ci An interval to traverse by
     * @param callable $callback The callback to use for filtering.
     * @param \Cake\Chronos\ChronosInterface|null $dt The instance to difference from.
     * @param bool $abs Get the absolute of the difference
     * @return int
     */
    // public function diffFiltered(ChronosInterval $ci, callable $callback, ChronosInterface $dt = null, $abs = true);

  public function diffInWeekdays(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInWeekendDays(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInHours(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInMinutes(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function diffInSeconds(
    ?ExtendedDateTimeInterface $dt = null,
    bool $abs = true
  ): int;

  public function secondsSinceMidnight(): int;

  public function secondsUntilEndOfDay(): int;

  public function startOfDay(): ExtendedDateTimeInterface;

  public function endOfDay(): ExtendedDateTimeInterface;

  public function startOfMonth(): ExtendedDateTimeInterface;

  public function endOfMonth(): ExtendedDateTimeInterface;

  public function startOfYear(): ExtendedDateTimeInterface;

  public function endOfYear(): ExtendedDateTimeInterface;

  public function startOfDecade(): ExtendedDateTimeInterface;

  public function endOfDecade(): ExtendedDateTimeInterface;

  public function startOfCentury(): ExtendedDateTimeInterface;

  public function endOfCentury(): ExtendedDateTimeInterface;

  public function startOfWeek(): ExtendedDateTimeInterface;

  public function endOfWeek(): ExtendedDateTimeInterface;

  /**
   * Modify to the next occurrence of a given day of the week.
   * If no dayOfWeek is provided, modify to the next occurrence
   * of the current day of the week.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function next(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the previous occurrence of a given day of the week.
   * If no dayOfWeek is provided, modify to the previous occurrence
   * of the current day of the week.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function previous(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the first occurrence of a given day of the week
   * in the current month. If no dayOfWeek is provided, modify to the
   * first day of the current month.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function firstOfMonth(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the last occurrence of a given day of the week
   * in the current month. If no dayOfWeek is provided, modify to the
   * last day of the current month.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function lastOfMonth(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the given occurrence of a given day of the week
   * in the current month. If the calculated occurrence is outside the scope
   * of the current month, then return false and no modifications are made.
   * Use the supplied consts to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function nthOfMonth(int $nth, int $dayOfWeek): mixed;

  /**
   * Modify to the first occurrence of a given day of the week
   * in the current quarter. If no dayOfWeek is provided, modify to the
   * first day of the current quarter.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function firstOfQuarter(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the last occurrence of a given day of the week
   * in the current quarter. If no dayOfWeek is provided, modify to the
   * last day of the current quarter.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function lastOfQuarter(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the given occurrence of a given day of the week
   * in the current quarter. If the calculated occurrence is outside the scope
   * of the current quarter, then return false and no modifications are made.
   * Use the supplied consts to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function nthOfQuarter(int $nth, int $dayOfWeek): mixed;

  /**
   * Modify to the first occurrence of a given day of the week
   * in the current year. If no dayOfWeek is provided, modify to the
   * first day of the current year.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function firstOfYear(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the last occurrence of a given day of the week
   * in the current year. If no dayOfWeek is provided, modify to the
   * last day of the current year.  Use the supplied consts
   * to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function lastOfYear(?int $dayOfWeek = null): mixed;

  /**
   * Modify to the given occurrence of a given day of the week
   * in the current year. If the calculated occurrence is outside the scope
   * of the current year, then return false and no modifications are made.
   * Use the supplied consts to indicate the desired dayOfWeek, ex. static::MONDAY.
   */
  public function nthOfYear(int $nth, int $dayOfWeek): mixed;

  /**
   * Modify the current instance to the average of a given instance (default now) and the current instance.
   */
  public function average(
    ?ExtendedDateTimeInterface $dt = null
  ): ExtendedDateTimeInterface;

  /**
   * Check if its the birthday. Compares the date/month values of the two dates.
   */
  public function isBirthday(
    ExtendedDateTimeInterface $dt
  ): bool;

  /**
   * Returns true this instance happened within the specified interval
   */
  public function wasWithinLast(arraykey $timeInterval): bool;

  /**
   * Returns true this instance will happen within the specified interval
   *
   * @param string|int $timeInterval the numeric value with space then time type.
   *    Example of valid types: 6 hours, 2 days, 1 minute.
   */
  public function isWithinNext(arraykey $timeInterval): bool;

  public function isMutable(): bool;
}
