use type Ytake\Caerus\Interval;
use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

abstract class AbstractTestCase extends HackTest {

  protected function toBeSameIntervalProperties(
    Interval $hi,
    int $years,
    int $months = 0,
    int $days = 0,
    int $hours = 0,
    int $minutes = 0,
    int $seconds = 0
  ): void {
    expect($years)->toBeSame($hi->years, 'Interval->years');
    expect($months)->toBeSame($hi->months, 'Interval->months');
    expect($days)->toBeSame($hi->dayz, 'Interval->dayz');
    expect($hours)->toBeSame($hi->hours, 'Interval->hours');
    expect($minutes)->toBeSame($hi->minutes, 'Interval->minutes');
    expect($seconds)->toBeSame($hi->seconds, 'Interval->seconds');
  }
}
