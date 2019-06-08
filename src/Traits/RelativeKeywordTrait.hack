namespace Ytake\Caerus\Traits;

use namespace HH\Lib\{Regex, C};

trait RelativeKeywordTrait {

  public static function hasRelativeKeywords(
    string $time
  ): bool {
    if (Regex\matches($time, re"/^[0-2]?[0-9]:[0-5][0-9](?::[0-5][0-9])?$/")) {
      return true;
    }
    if (!Regex\matches($time, re"/[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/")) {
      return C\count(
        Regex\every_match(
          $time,
          re"/this|next|last|tomorrow|yesterday|midnight|today|[+-]|first|last|ago/i"
        )
      ) > 0;
    }
    return false;
  }
}
