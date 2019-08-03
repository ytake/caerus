namespace Ytake\Caerus\Traits;

use type Ytake\Caerus\ExtendedDateTime;

trait MemoryTrait {
  require extends ExtendedDateTime;

  <<__Memoize>>
  public function copy(): ExtendedDateTime {
    return static::instance($this);
  }
}
