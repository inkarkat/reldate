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

run_with_input_produces_output(['--relative-each', '--within', 'all'], $input, qq{
At 20180501_071159, we said "1 hour later than that will happen".
At 221 days later than that, she said "1 day before that was good, until 1 hour later than that".
At 32 days later than that, she said "Nee".
At 10 days later than that, he said "Between 49 minutes later than that and 5 seconds later than that".
At 2 days later than that, she met at that time.
At 1 year later than that, he said "Between 2 days before that and 5 days later than that".}, 'relative each in all');

run_with_input_produces_output(['--relative-each', '--within', '"[^"]+"'], $input, qq{
At 20180501_071159, we said "20180501_083000 will happen".
At 20181208_060000, she said "20181207_060000 was good, until 1 hour later than that".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 20190118_130000 and 5 seconds later than that".
At 20190120_124000, she met 20190120_124000.
At 20200601_120000, he said "Between 20200530_120000 and 5 days later than that".}, 'relative each inside double quoted text');

done_testing;
