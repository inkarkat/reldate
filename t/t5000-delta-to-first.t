use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = qq{
At 20180501_071159, we said "20180501_083000 will happen".
At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 20190118_130000 and 20190118_130005".
At 20190120_124000, she met 20190120_124000.
At 20200601_120000, he said "Between 20200530_120000 and 20200604_120000".};
my $expected = qq{
At 267 days ago, we said "1 hour after it will happen".
At 46 days ago, she said "1 day before it was good, until also 23 hours before it".
At 15 days ago, she said "Nee".
At 4 days ago, he said "Between 49 minutes after it and also 49 minutes after it".
At 2 days ago, she met at its time.
At in 1 year, he said "Between 2 days before it and also 3 days after it".};

run_with_input_produces_output(['--delta-to-first'], $input, $expected, 'delta to first in each line');
run_with_input_produces_output(['--delta-to-first', '--within', 'line'], $input, $expected, 'delta to first in each line with within arg');

done_testing;
