namespace Ytake\Caerus;

use type DateTimeImmutable;
use namespace Ytake\Caerus\Traits;

class Caerus extends DateTimeImmutable implements ExtendedDateTimeInterface {
  use Traits\FactoryTrait;
  use Traits\TimezoneTrait;
  use Traits\RelativeKeywordTrait;
}
