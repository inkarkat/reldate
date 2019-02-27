use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = qq{
At 20180501_071159, we said "20180501_083000 will happen".
At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 20190118_130000 and 20190118_130005".
At 20190122_204123, she met 20190122_203001.
At 20200601_120000, he said "Between 20200530_120000 and 20200604_120000".};

run_with_input_produces_output(['--precision', 1], $input, qq{
At 267 days ago, we said "267 days ago will happen".
At 46 days ago, she said "47 days ago was good, until 47 days ago".
At 15 days ago, she said "Nee".
At 4 days ago, he said "Between 4 days ago and 4 days ago".
At in 11 minutes, she met in 1 second.
At in 1 year, he said "Between in 1 year and in 1 year".}, 'precision 1');

run_with_input_produces_output(['--precision', 2], $input, qq{
At 266 days and 14 hours ago, we said "266 days and 13 hours ago will happen".
At 45 days and 15 hours ago, she said "46 days and 15 hours ago was good, until 46 days and 14 hours ago".
At 14 days and 15 hours ago, she said "Nee".
At 4 days and 8 hours ago, he said "Between 4 days and 8 hours ago and 4 days and 7 hours ago".
At in 11 minutes and 23 seconds, she met in 1 second.
At in 1 year and 131 days, he said "Between in 1 year and 129 days and in 1 year and 134 days".}, 'precision 2');

run_with_input_produces_output(['--precision', 3], $input, qq{
At 266 days, 14 hours, and 18 minutes ago, we said "266 days and 13 hours ago will happen".
At 45 days, 14 hours, and 30 minutes ago, she said "46 days, 14 hours, and 30 minutes ago was good, until 46 days, 13 hours, and 30 minutes ago".
At 14 days, 14 hours, and 30 minutes ago, she said "Nee".
At 4 days, 8 hours, and 19 minutes ago, he said "Between 4 days, 7 hours, and 30 minutes ago and 4 days, 7 hours, and 30 minutes ago".
At in 11 minutes and 23 seconds, she met in 1 second.
At in 1 year, 130 days, and 15 hours, he said "Between in 1 year, 128 days, and 15 hours and in 1 year, 133 days, and 15 hours".}, 'precision 3');

my $expectedPrecision4 = qq{
At 266 days, 14 hours, 18 minutes, and 1 second ago, we said "266 days and 13 hours ago will happen".
At 45 days, 14 hours, and 30 minutes ago, she said "46 days, 14 hours, and 30 minutes ago was good, until 46 days, 13 hours, and 30 minutes ago".
At 14 days, 14 hours, and 30 minutes ago, she said "Nee".
At 4 days, 8 hours, 18 minutes, and 49 seconds ago, he said "Between 4 days, 7 hours, and 30 minutes ago and 4 days, 7 hours, 29 minutes, and 55 seconds ago".
At in 11 minutes and 23 seconds, she met in 1 second.
At in 1 year, 130 days, 14 hours, and 30 minutes, he said "Between in 1 year, 128 days, 14 hours, and 30 minutes and in 1 year, 133 days, 14 hours, and 30 minutes".};
run_with_input_produces_output(['--precision', 4], $input, $expectedPrecision4, 'precision 4');
run_with_input_produces_output(['--precision', 5], $input, $expectedPrecision4, 'precision 5');

done_testing;
