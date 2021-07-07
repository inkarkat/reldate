use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = '
At @1525151519, we said "@1525156200 will happen".
At @1544245200, she said "@1544158800 was good, until @1544162400".
At @1546923600, she said "Nee".
At @1547809871, he said "Between @1547812800 and @1547812805".
At @1547984400, she met @1547984400.
At @1591005600, he said "Between @1590832800 and @1591264800".';

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
