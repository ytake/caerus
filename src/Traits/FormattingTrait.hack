namespace Ytake\Caerus\Traits;

use type Ytake\Caerus\{ExtendedDateTime, ExtendedDateTimeInterface};
use type DateTime;
use function ceil;

trait FormattingTrait {
  require extends ExtendedDateTime;
  require implements ExtendedDateTimeInterface;

  public static function resetToStringFormat(): void {
    static::setToStringFormat(
      ExtendedDateTimeInterface::DEFAULT_TO_STRING_FORMAT
    );
  }

  public static function setToStringFormat(
    string $format
  ): void {
    static::$toStringFormat = $format;
  }

  public function __toString(): string {
    return $this->format(static::$toStringFormat);
  }

  public function toDateString(): string {
    return $this->format('Y-m-d');
  }

  public function toFormattedDateString(): string {
    return $this->format('M j, Y');
  }

  public function toTimeString(): string {
    return $this->format('H:i:s');
  }

  public function toDateTimeString(): string {
    return $this->format('Y-m-d H:i:s');
  }

  public function toDayDateTimeString(): string {
    return $this->format('D, M j, Y g:i A');
  }

  public function toAtomString(): string {
    return $this->format(DateTime::ATOM);
  }

  public function toCookieString(): string {
    return $this->format(DateTime::COOKIE);
  }

  public function toIso8601String(): string {
    return $this->format(DateTime::ATOM);
  }

  public function toRfc822String(): string {
    return $this->format(DateTime::RFC822);
  }

  public function toRfc850String(): string {
    return $this->format(DateTime::RFC850);
  }

  public function toRfc1036String(): string {
    return $this->format(DateTime::RFC1036);
  }

  public function toRfc1123String(): string {
    return $this->format(DateTime::RFC1123);
  }

  public function toRfc2822String(): string {
    return $this->format(DateTime::RFC2822);
  }

  public function toRfc3339String(): string {
    return $this->format(DateTime::RFC3339);
  }

  public function toRssString(): string {
    return $this->format(DateTime::RSS);
  }

  public function toW3cString(): string {
    return $this->format(DateTime::W3C);
  }

  public function toUnixString(): string {
    return $this->format('U');
  }

  public function toQuarter(
    bool $range = false
  ): mixed {
    $quarter = ceil($this->format('m') / 3);
    if ($range === false) {
      return $quarter;
    }
    $year = $this->format('Y');
    switch ($quarter) {
      case 1:
        return vec[$year . '-01-01', $year . '-03-31'];
      case 2:
        return vec[$year . '-04-01', $year . '-06-30'];
      case 3:
        return vec[$year . '-07-01', $year . '-09-30'];
      case 4:
        return vec[$year . '-10-01', $year . '-12-31'];
    }
    throw new \LogicException();
  }

  public function toWeek(): int {
    return (int)$this->format('W');
  }
}
