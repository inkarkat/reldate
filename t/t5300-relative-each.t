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
At 20180501_071159, we said "1 hour later will happen".
At 20181208_060000, she said "1 day earlier was good, until 1 hour later".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 49 minutes later and 5 seconds later".
At 20190120_124000, she met also then.
At 20200601_120000, he said "Between 2 days earlier and 5 days later".};

run_with_input_produces_output(['--relative-each'], $input, $expected, 'relative each in each line');
run_with_input_produces_output(['--relative-each', '--within', 'line'], $input, $expected, 'relative each in each line with within arg');

done_testing;
