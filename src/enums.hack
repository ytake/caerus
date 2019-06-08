namespace Ytake\Caerus;

enum Day: int {
  MONDAY = 1;
  TUESDAY = 2;
  WEDNESDAY = 3;
  THURSDAY = 4;
  FRIDAY = 5;
  SATURDAY = 6;
  SUNDAY = 7;
}

// Number of X in Y
enum NumberOf: int as int {
  YEARS_PER_CENTURY = 100;
  YEARS_PER_DECADE = 10;
  MONTHS_PER_YEAR = 12;
  MONTHS_PER_QUARTER = 3;
  WEEKS_PER_YEAR = 52;
  DAYS_PER_WEEK = 7;
  HOURS_PER_DAY = 24;
  MINUTES_PER_HOUR = 60;
  SECONDS_PER_MINUTE = 60;
}

enum Unit: string as string {
  YEAR = 'year';
  MONTH = 'month';
  DAY = 'day';
  WEEK = 'week';
  HOUR = 'hour';
  MINUTE = 'minute';
  SECOND ='second';
}

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

enum Period: string as string {
  PREFIX = 'P';
  YEARS = 'Y';
  MONTHS = 'M';
  DAYS = 'D';
  TIME_PREFIX = 'T';
  HOURS = 'H';
  MINUTES = 'M';
  SECONDS = 'S';
}
