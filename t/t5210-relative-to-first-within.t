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
At 20180501_071159, we said "1 hour later than it will happen".
At also 221 days later than it, she said "also 220 days later than it was good, until also 220 days later than it".
At also 252 days later than it, she said "Nee".
At also 262 days later than it, he said "Between also 262 days later than it and also 262 days later than it".
At also 264 days later than it, she met also 264 days later than it.
At also 2 years later than it, he said "Between also 2 years later than it and also 2 years later than it".}, 'relative to first in all');

run_with_input_produces_output(['--relative-to-first', '--within', '"[^"]+"'], $input, qq{
At 20180501_071159, we said "20180501_083000 will happen".
At 20181208_060000, she said "20181207_060000 was good, until 1 hour later than it".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 20190118_130000 and 5 seconds later than it".
At 20190120_124000, she met 20190120_124000.
At 20200601_120000, he said "Between 20200530_120000 and 5 days later than it".}, 'relative to first inside double quoted text');

done_testing;
