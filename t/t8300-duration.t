use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--duration', '--timespan', '60'], '-1m', 'timespan of 60 seconds as duration');
run_produces_output(['--duration', '--timespan', '+60'], '-1m', 'timespan of +60 seconds as duration');
run_produces_output(['--duration', '--timespan', '-60'], '1m', 'timespan of -60 seconds as duration');

run_produces_output(['--duration', '--timespan', '120'], '-2m', 'timespan of 120 seconds as duration');
run_produces_output(['--duration', '--timespan', '122'], '-02:02', 'timespan of 122 seconds as duration');

run_produces_output(['--duration', '--timespan', '0'], '', 'timespan of 0 seconds as duration');
run_produces_output(['--duration', '--timespan', '+0'], '', 'timespan of +0 seconds as duration');
run_produces_output(['--duration', '--timespan', '-0'], '', 'timespan of -0 seconds as duration');
run_produces_output(['--duration', '--timespan', '90000'], '-1d 1h', 'timespan of 1 day as duration');
run_produces_output(['--duration', '--timespan', '32000000'], '-52w 6d 08:53:20', 'timespan of 1 year as duration');

run_produces_output(['--duration', '--epoch', $NOW + 60], '1m', 'epoch 60 seconds later as duration');
run_produces_output(['--duration', '--epoch', $NOW - 120], '-2m', 'epoch 120 seconds earlier as duration');

run_with_input_produces_output(['--duration'], 'At 20190122_060000.', 'At -14h 30m.', 'simple format earlier time as duration');
run_with_input_produces_output(['--duration', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At -38w 14:18:01, we said 01:18:01 will happen' , 'delta to first in each line as duration');
run_with_input_produces_output(['--duration', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At -6w 3d 14h 30m, she said "-1d was good, until 1h".', 'delta each in each line as duration');
run_with_input_produces_output(['--duration', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "-1d was good, until also -23h".', 'relative to first as duration');
run_with_input_produces_output(['--duration', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At -4w 3d, she said "-4w 4d was good, until -4w 3d 23h".', 'relative to base date as duration');

run_with_input_produces_output(['--duration', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_060000.', 'At -[-14h 30m   ]-.', 'constant-width output as duration');

done_testing;
