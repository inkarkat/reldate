use Modern::Perl;
use Test::More;
use Test::Reldate;

run_with_input_produces_output([], '
At @1525151519, we said "@1525156200 will happen".
At @1544245200, she said "@1544158800 was good, until @1544162400".
At @1546923600, she said "Nee".
At @1547809871, he said "Between @1547812800 and @1547812805".
At @1547984400, she met @1547984400.
At @1591005600, he said "Between @1590832800 and @1591264800".', qq{
At 267 days ago, we said "267 days ago will happen".
At 46 days ago, she said "47 days ago was good, until 47 days ago".
At 15 days ago, she said "Nee".
At 4 days ago, he said "Between 4 days ago and 4 days ago".
At 2 days ago, she met 2 days ago.
At in 1 year, he said "Between in 1 year and in 1 year".}, 'simple format multiple per line');

done_testing;
