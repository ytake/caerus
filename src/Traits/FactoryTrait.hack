namespace Ytake\Caerus\Traits;

use namespace HH\Lib\C;
use type DateTimeZone;
use type Ytake\Caerus\ExtendedDateTimeInterface;
use function strval;
use function date_default_timezone_get;
use function method_exists;

trait FactoryTrait {
  require implements ExtendedDateTimeInterface;

  protected static dict<arraykey, mixed> $lastErrors = dict[];
}
