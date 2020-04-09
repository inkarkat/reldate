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

run_with_input_produces_output(['--relative-to', '20190108_060000'], $input, qq{
At 252 days before it, we said "252 days before it will happen".
At 31 days before it, she said "32 days before it was good, until 32 days before it".
At at its time, she said "Nee".
At 10 days after it, he said "Between 10 days after it and 10 days after it".
At 12 days after it, she met 12 days after it.
At 1 year after it, he said "Between 1 year after it and 1 year after it".}, 'relative to base date');

run_with_input_produces_output(['--relative-to-epoch', 1546923600], $input, qq{
At 252 days before it, we said "252 days before it will happen".
At 31 days before it, she said "32 days before it was good, until 32 days before it".
At at its time, she said "Nee".
At 10 days after it, he said "Between 10 days after it and 10 days after it".
At 12 days after it, she met 12 days after it.
At 1 year after it, he said "Between 1 year after it and 1 year after it".}, 'relative to base epoch');

done_testing;
