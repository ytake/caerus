namespace Ytake\Caerus;

use namespace Ytake\Caerus\Traits;

class Caerus extends ExtendedDateTime implements ExtendedDateTimeInterface {
  use Traits\FactoryTrait;
  use Traits\FrozenTimeTrait;
  use Traits\FormattingTrait;
  use Traits\TimezoneTrait;
  use Traits\RelativeKeywordTrait;
}
