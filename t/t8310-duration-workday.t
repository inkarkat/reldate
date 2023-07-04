use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--duration', '--workday', '--timespan', '60'], '-1m', 'timespan of 60 seconds as duration');
run_produces_output(['--duration', '--workday', '--timespan', '+60'], '-1m', 'timespan of +60 seconds as duration');
run_produces_output(['--duration', '--workday', '--timespan', '-60'], '1m', 'timespan of -60 seconds as duration');

run_produces_output(['--duration', '--workday', '--timespan', '120'], '-2m', 'timespan of 120 seconds as duration');
run_produces_output(['--duration', '--workday', '--timespan', '122'], '-02:02', 'timespan of 122 seconds as duration');

run_produces_output(['--duration', '--workday', '--timespan', '0'], '', 'timespan of 0 seconds as duration');
run_produces_output(['--duration', '--workday', '--timespan', '+0'], '', 'timespan of +0 seconds as duration');
run_produces_output(['--duration', '--workday', '--timespan', '-0'], '', 'timespan of -0 seconds as duration');
run_produces_output(['--duration', '--workday', '--timespan', '90000'], '-3wd 1h', 'timespan of 1 day as duration');
run_produces_output(['--duration', '--workday', '--timespan', '32000000'], '-222ww 1wd 00:53:20', 'timespan of 1 year as duration');

run_produces_output(['--duration', '--workday', '--epoch', $NOW + 60], '1m', 'epoch 60 seconds later as duration');
run_produces_output(['--duration', '--workday', '--epoch', $NOW - 120], '-2m', 'epoch 120 seconds earlier as duration');

run_with_input_produces_output(['--duration', '--workday'], 'At 20190122_060000.', 'At -1wd 6h 30m.', 'simple format earlier time as duration');
run_with_input_produces_output(['--duration', '--workday', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At -159ww 4wd 06:18:01, we said 01:18:01 will happen' , 'delta to first in each line as duration');
run_with_input_produces_output(['--duration', '--workday', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At -27ww 1wd 6h 30m, she said "-3wd was good, until 1h".', 'delta each in each line as duration');
run_with_input_produces_output(['--duration', '--workday', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "-3wd was good, until also -2wd 7h".', 'relative to first as duration');
run_with_input_produces_output(['--duration', '--workday', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At -18ww 3wd, she said "-19ww 1wd was good, until -19ww 7h".', 'relative to base date as duration');

run_with_input_produces_output(['--duration', '--workday', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_063000.', 'At -[-1wd 6h    ]-.', 'constant-width output as duration');

done_testing;
