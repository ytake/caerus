namespace Ytake\Hurry;

class DifferenceFormatter {

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
      // $date-> now($date);
    }
    invariant($other is nonnull, 'error');
    $diffInterval = $date->diff($other);
    invariant($diffInterval is \DateInterval, 'error no DateInterval class');
    switch (true) {
      case ($diffInterval->y > 0):
        $unit = 'year';
        $count = $diffInterval->y;
        break;
      }
  }
}
