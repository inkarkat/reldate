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

run_with_input_produces_output(['--relative-to-first', '--within', 'all'], $input, qq{
At 20180501_071159, we said "1 hour after it will happen".
At also 221 days after it, she said "also 220 days after it was good, until also 220 days after it".
At also 252 days after it, she said "Nee".
At also 262 days after it, he said "Between also 262 days after it and also 262 days after it".
At also 264 days after it, she met also 264 days after it.
At also 2 years after it, he said "Between also 2 years after it and also 2 years after it".}, 'relative to first in all');

run_with_input_produces_output(['--relative-to-first', '--within', '"[^"]+"'], $input, qq{
At 20180501_071159, we said "20180501_083000 will happen".
At 20181208_060000, she said "20181207_060000 was good, until 1 hour after it".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 20190118_130000 and 5 seconds after it".
At 20190120_124000, she met 20190120_124000.
At 20200601_120000, he said "Between 20200530_120000 and 5 days after it".}, 'relative to first inside double quoted text');

done_testing;
