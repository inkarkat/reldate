use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--difference', '--timespan', '60'], '-60', 'timespan of 60 seconds as difference');
run_produces_output(['--difference', '--timespan', '+60'], '-60', 'timespan of +60 seconds as difference');
run_produces_output(['--difference', '--timespan', '-60'], '60', 'timespan of -60 seconds as difference');

run_produces_output(['--difference', '--timespan', '120'], '-120', 'timespan of 120 seconds as difference');
run_produces_output(['--difference', '--timespan', '122'], '-122', 'timespan of 122 seconds as difference');

run_produces_output(['--difference', '--timespan', '0'], '0', 'timespan of 0 seconds as difference');
run_produces_output(['--difference', '--timespan', '+0'], '0', 'timespan of +0 seconds as difference');
run_produces_output(['--difference', '--timespan', '-0'], '0', 'timespan of -0 seconds as difference');
run_produces_output(['--difference', '--timespan', '90000'], '-90000', 'timespan of 1 day as difference');
run_produces_output(['--difference', '--timespan', '32000000'], '-32000000', 'timespan of 1 year as difference');

run_produces_output(['--difference', '--epoch', $NOW + 60], '60', 'epoch 60 seconds later as difference');
run_produces_output(['--difference', '--epoch', $NOW - 120], '-120', 'epoch 120 seconds earlier as difference');

run_with_input_produces_output(['--difference'], 'At 20190122_060000.', 'At -52200.', 'simple format earlier time as difference');
run_with_input_produces_output(['--difference', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At -23033881, we said 4681 will happen' , 'delta to first in each line as difference');
run_with_input_produces_output(['--difference', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At -3940200, she said "-86400 was good, until 3600".', 'delta each in each line as difference');
run_with_input_produces_output(['--difference', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "-86400 was good, until also -82800".', 'relative to first as difference');
run_with_input_produces_output(['--difference', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At -2678400, she said "-2764800 was good, until -2761200".', 'relative to base date as difference');

run_with_input_produces_output(['--difference', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_060000.', 'At -[-52200     ]-.', 'constant-width output as difference');

done_testing;
