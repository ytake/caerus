namespace Ytake\Hurry;

use type DateTimeInterface;
use type DateTimeZone;

interface ExtendedDateTimeInterface extends DateTimeInterface {

  const string DEFAULT_TO_STRING_FORMAT = 'Y-m-d H:i:s';

}
