use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--no-direction', '--timespan', '60'], '1 minute', 'timespan of 60 seconds without direction');
run_produces_output(['--no-direction', '--timespan', '-60'], '1 minute', 'timespan of -60 seconds without direction');
run_produces_output(['--no-direction', '--timespan', '+60'], '1 minute', 'timespan of +60 seconds without direction');

run_produces_output(['--no-direction', '--timespan', '120'], '2 minutes', 'timespan of 120 seconds without direction');
run_produces_output(['--no-direction', '--timespan', '122'], '2 minutes', 'timespan of 122 seconds without direction');

run_produces_output(['--no-direction', '--timespan', '0'], 'no time', 'timespan of 0 seconds without direction');
run_produces_output(['--no-direction', '--timespan', '-0'], 'just now', 'timespan of -0 seconds without direction');
run_produces_output(['--no-direction', '--timespan', '+0'], 'just now', 'timespan of +0 seconds without direction');
run_produces_output(['--no-direction', '--timespan', '90000'], '1 day', 'timespan of 1 day without direction');
run_produces_output(['--no-direction', '--timespan', '32000000'], '1 year', 'timespan of 1 year without direction');

run_produces_output(['--no-direction', '--epoch', $NOW + 60], '1 minute', 'epoch 60 seconds later without direction');
run_produces_output(['--no-direction', '--epoch', $NOW - 120], '2 minutes', 'epoch 120 seconds earlier without direction');

run_with_input_produces_output(['--no-direction'], 'At 20190122_060000.', 'At 15 hours.', 'simple format earlier time without direction');
run_with_input_produces_output(['--no-direction', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At 267 days, we said 1 hour after it will happen' , 'delta to first in each line without direction');
run_with_input_produces_output(['--no-direction', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 46 days, she said "1 day earlier was good, until 1 hour later".', 'delta each in each line without direction');
run_with_input_produces_output(['--no-direction', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "1 day before it was good, until also 23 hours before it".', 'relative to first without direction');
run_with_input_produces_output(['--no-direction', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 31 days before it, she said "32 days before it was good, until 32 days before it".', 'relative to base date without direction');

run_with_input_produces_output(['--no-direction', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_060000.', 'At -[15 hours   ]-.', 'constant-width output without direction');

done_testing;
