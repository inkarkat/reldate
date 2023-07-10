use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--short-units', '--timespan', '60'], '1m', 'timespan of 60 seconds with shortened unit');
run_produces_output(['--short-units', '--timespan', '-60'], '1m ago', 'timespan of -60 seconds with shortened unit');
run_produces_output(['--short-units', '--timespan', '+60'], 'in 1m', 'timespan of +60 seconds with shortened unit');

run_produces_output(['--short-units', '--timespan', '120'], '2m', 'timespan of 120 seconds with shortened unit');
run_produces_output(['--short-units', '--timespan', '122'], '2m', 'timespan of 122 seconds with shortened unit');

run_produces_output(['--short-units', '--timespan', '0'], 'no time', 'timespan of 0 seconds with shortened unit');
run_produces_output(['--short-units', '--timespan', '-0'], 'just now', 'timespan of -0 seconds with shortened unit');
run_produces_output(['--short-units', '--timespan', '+0'], 'just now', 'timespan of +0 seconds with shortened unit');
run_produces_output(['--short-units', '--timespan', '90000'], '1d', 'timespan of 1 day with shortened unit');
run_produces_output(['--short-units', '--timespan', '32000000'], '1y', 'timespan of 1 year with shortened unit');

run_produces_output(['--short-units', '--epoch', $NOW + 60], 'in 1m', 'epoch 60 seconds later with shortened unit');
run_produces_output(['--short-units', '--epoch', $NOW - 120], '2m ago', 'epoch 120 seconds earlier with shortened unit');

run_with_input_produces_output(['--short-units'], 'At 20190122_060000.', 'At 15h ago.', 'simple format earlier time with shortened unit');
run_with_input_produces_output(['--short-units', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At 267d ago, we said 1h after it will happen' , 'delta to first in each line with shortened unit');
run_with_input_produces_output(['--short-units', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 46d ago, she said "1d earlier was good, until 1h later".', 'delta each in each line with shortened unit');
run_with_input_produces_output(['--short-units', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "1d before it was good, until also 23h before it".', 'relative to first with shortened unit');
run_with_input_produces_output(['--short-units', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 31d before it, she said "32d before it was good, until 32d before it".', 'relative to base date with shortened unit');

run_with_input_produces_output(['--short-units', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_060000.', 'At -[15h ago    ]-.', 'constant-width output with shortened unit');

done_testing;
