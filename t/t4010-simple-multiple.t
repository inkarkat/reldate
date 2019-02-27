use Modern::Perl;
use Test::More;
use Test::Reldate;

run_with_input_produces_output([], qq{
At 20180501_071159, we said "20180501_083000 will happen".
At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Between 20190118_130000 and 20190118_130005".
At 20190120_124000, she met 20190120_124000.
At 20200601_120000, he said "Between 20200530_120000 and 20200604_120000".}, qq{
At 267 days ago, we said "267 days ago will happen".
At 46 days ago, she said "47 days ago was good, until 47 days ago".
At 15 days ago, she said "Nee".
At 4 days ago, he said "Between 4 days ago and 4 days ago".
At 2 days ago, she met 2 days ago.
At in 1 year, he said "Between in 1 year and in 1 year".}, 'simple format multiple per line');

done_testing;
