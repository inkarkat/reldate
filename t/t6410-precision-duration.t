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

run_with_input_produces_output(['--duration', '--precision', 1], $input, qq{
At -38w, we said "-38w will happen".
At -7w, she said "-7w was good, until -7w".
At -2w, she said "Nee".
At -4d, he said "Between -4d and -4d".
At 11:23, she met 1s.
At 71w, he said "Between 71w and 71w".}, 'precision 1');

run_with_input_produces_output(['--duration', '--precision', 2], $input, qq{
At -38w 14:18:01, we said "-38w 13h will happen".
At -6w 4d, she said "-6w 5d was good, until -6w 5d".
At -2w 15h, she said "Nee".
At -4d 08:18:49, he said "Between -4d 8h and -4d 07:29:55".
At 11:23, she met 1s.
At 70w 6d, he said "Between 70w 4d and 71w 2d".}, 'precision 2');

run_with_input_produces_output(['--duration', '--precision', 3], $input, qq{
At -38w 14:18:01, we said "-38w 13h will happen".
At -6w 3d 15h, she said "-6w 4d 15h was good, until -6w 4d 14h".
At -2w 14h 30m, she said "Nee".
At -4d 08:18:49, he said "Between -4d 7h 30m and -4d 07:29:55".
At 11:23, she met 1s.
At 70w 5d 15h, he said "Between 70w 3d 15h and 71w 1d 15h".}, 'precision 3');

my $expectedPrecision4 = qq{
At -38w 14:18:01, we said "-38w 13h will happen".
At -6w 3d 14h 30m, she said "-6w 4d 14h 30m was good, until -6w 4d 13h 30m".
At -2w 14h 30m, she said "Nee".
At -4d 08:18:49, he said "Between -4d 7h 30m and -4d 07:29:55".
At 11:23, she met 1s.
At 70w 5d 14h 30m, he said "Between 70w 3d 14h 30m and 71w 1d 14h 30m".};
run_with_input_produces_output(['--duration', '--precision', 4], $input, $expectedPrecision4, 'precision 4');
run_with_input_produces_output(['--duration', '--precision', 5], $input, $expectedPrecision4, 'precision 5');

done_testing;
