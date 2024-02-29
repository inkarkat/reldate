use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--no-direction', '--short', '--timespan', '60'], '1m', 'timespan of 60 seconds short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '-60'], '1m', 'timespan of -60 seconds short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '+60'], '1m', 'timespan of +60 seconds short without direction');

run_produces_output(['--no-direction', '--short', '--timespan', '120'], '2m', 'timespan of 120 seconds short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '122'], '2m', 'timespan of 122 seconds short without direction');

run_produces_output(['--no-direction', '--short', '--timespan', '0'], '=0s', 'timespan of 0 seconds short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '-0'], '0s', 'timespan of -0 seconds short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '+0'], '0s', 'timespan of +0 seconds short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '90000'], '1d', 'timespan of 1 day short without direction');
run_produces_output(['--no-direction', '--short', '--timespan', '32000000'], '1y', 'timespan of 1 year short without direction');

run_produces_output(['--no-direction', '--short', '--epoch', $NOW + 60], '1m', 'epoch 60 seconds later short without direction');
run_produces_output(['--no-direction', '--short', '--epoch', $NOW - 120], '2m', 'epoch 120 seconds earlier short without direction');

run_with_input_produces_output(['--no-direction'], 'At 20190122_060000.', 'At 15h.', 'simple format earlier time short without direction');
run_with_input_produces_output(['--no-direction', '--short', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At 267d, we said 1h after it will happen' , 'delta to first in each line short without direction');
run_with_input_produces_output(['--no-direction', '--short', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 46d, she said "-1d was good, until +1h".', 'delta each in each line short without direction');
run_with_input_produces_output(['--no-direction', '--short', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "1d before it was good, until also 23h before it".', 'relative to first short without direction');
run_with_input_produces_output(['--no-direction', '--short', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 31d before it, she said "32d before it was good, until 32d before it".', 'relative to base date short without direction');

run_with_input_produces_output(['--no-direction', '--short', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_060000.', 'At -[15h        ]-.', 'constant-width output short without direction');

done_testing;
