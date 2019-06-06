namespace Ytake\Hurry;

use namespace HH\Lib\Str;
use function array_keys;
use function str_replace;

enum DiffString: string as string {
  YEAR = '1 year';
  YEAR_PLURAL = '{count} years';
  MONTH = '1 month';
  MONTH_PLURAL = '{count} months';
  WEEK = '1 week';
  WEEK_PLURAL = '{count} weeks';
  DAY = '1 day';
  DAY_PLURAL = '{count} days';
  HOUR = '1 hour';
  HOUR_PLURAL = '{count} hours';
  MINUITE = '1 minute';
  MINUITE_PLURAL = '{count} minutes';
  SECOND = '1 second';
  SECOND_PLURAL = '{count} seconds';
  AGO = '{time} ago';
  FROM_NOW = '{time} from now';
  AFTER = '{time} after';
  BEFORE = '{time} before';
}

final class Translator {

  public function singular(
    DiffString $key,
    vec<int> $vars = vec[]
  ): string {
    $varKeys = array_keys($vars);
    foreach ($varKeys as $i => $k) {
      $varKeys[$i] = '{' . $k . '}';
    }
    return \str_replace($key, (string) $varKeys, $vars);
  }
}
