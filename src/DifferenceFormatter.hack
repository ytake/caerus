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
      $other = $date::now($date);
      // $date-> now($date);
    }
    $diffInterval = $date->diff($other);
  }
}
