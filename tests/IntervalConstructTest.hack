use type DateInterval;
use type Ytake\Caerus\NumberOf;
use type Ytake\Caerus\Interval;
use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

class IntervalConstructTest extends AbstractTestCase {

  public function testShouldReturnIntervalInstance(): void {
    $i = new Interval();
    expect($i)->toBeInstanceOf(Interval::class);
    $this->toBeSameIntervalProperties($i, 1, 0, 0, 0, 0, 0);
  }

  // Not Supported __callStatic method in HHVM/Hack.
  public function testShouldRetrunDefaultArgsInstance(): void {
    $i = new Interval(0);
    $this->toBeSameIntervalProperties($i, 0, 0, 0, 0, 0, 0);
  }

  public function testAllArguments(): void {
    $i = new Interval(5, 6, 2, 5, 9, 10, 11);
    expect($i)->toBeInstanceOf(Interval::class);
    $this->toBeSameIntervalProperties($i, 5, 6, 19, 9, 10, 11);
  }

  public function testAllArgumentsWithStaticCreate(): void {
    $i = Interval::create(5, 6, 2, 5, 9, 10, 11);
    expect($i)->toBeInstanceOf(Interval::class);
    $this->toBeSameIntervalProperties($i, 5, 6, 19, 9, 10, 11);
  }

  public function testShouldReturnInstanceWithStaticInstanceMethod(): void {
    $i = Interval::instance(new DateInterval('P2Y1M5DT22H33M44S'));
    expect($i)->toBeInstanceOf(Interval::class);
    $this->toBeSameIntervalProperties($i, 2, 1, 5, 22, 33, 44);
    expect($i->days === 0 || $i->days === Interval::HHVM_DAYS_FALSE)->toBeTrue();
  }
}
