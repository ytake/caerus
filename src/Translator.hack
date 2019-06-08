namespace Ytake\Hurry;

use namespace HH\Lib\Dict;
use function str_replace;
use function array_key_exists;

final class Translator {

  public function exists(string $key): bool {
    $values = DiffString::getValues();
    return array_key_exists($key, $values);
  }

  public function plural(
    DiffString $key,
    int $count,
    dict<string, arraykey> $vars = dict[]
  ): string {
    if ($count === 1) {
      return $this->singular($key, $vars);
    }
    return $this->singular($key, Dict\merge(dict['count' => $count], $vars));
  }

  public function singular(
    DiffString $key,
    dict<string, arraykey> $vars = dict[]
  ): string {
    $varKeys = Dict\map_keys($vars, $k ==> (string) $k);
    foreach ($varKeys as $i => $k) {
      $varKeys[$i] = '{' . $k . '}';
    }
    return str_replace($key, (string) $varKeys, $vars);
  }
}
