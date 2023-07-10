use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--short-relations', '--timespan', '60'], '1 minute', 'timespan of 60 seconds with shortened relation');
run_produces_output(['--short-relations', '--timespan', '-60'], '1 minute ago', 'timespan of -60 seconds with shortened relation');
run_produces_output(['--short-relations', '--timespan', '+60'], 'in 1 minute', 'timespan of +60 seconds with shortened relation');

run_produces_output(['--short-relations', '--timespan', '120'], '2 minutes', 'timespan of 120 seconds with shortened relation');
run_produces_output(['--short-relations', '--timespan', '122'], '2 minutes', 'timespan of 122 seconds with shortened relation');

run_produces_output(['--short-relations', '--timespan', '0'], 'no time', 'timespan of 0 seconds with shortened relation');
run_produces_output(['--short-relations', '--timespan', '-0'], 'just now', 'timespan of -0 seconds with shortened relation');
run_produces_output(['--short-relations', '--timespan', '+0'], 'just now', 'timespan of +0 seconds with shortened relation');
run_produces_output(['--short-relations', '--timespan', '90000'], '1 day', 'timespan of 1 day with shortened relation');
run_produces_output(['--short-relations', '--timespan', '32000000'], '1 year', 'timespan of 1 year with shortened relation');

run_produces_output(['--short-relations', '--epoch', $NOW + 60], 'in 1 minute', 'epoch 60 seconds later with shortened relation');
run_produces_output(['--short-relations', '--epoch', $NOW - 120], '2 minutes ago', 'epoch 120 seconds earlier with shortened relation');

run_with_input_produces_output(['--short-relations'], 'At 20190122_060000.', 'At 15 hours ago.', 'simple format earlier time with shortened relation');
run_with_input_produces_output(['--short-relations', '--delta-to-first'], 'At 20180501_071159, we said 20180501_083000 will happen', 'At 267 days ago, we said 1 hour after it will happen' , 'delta to first in each line with shortened relation');
run_with_input_produces_output(['--short-relations', '--delta-each'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000 (or 20181207_070000)".', 'At 46 days ago, she said "-1 day was good, until +1 hour (or also then)".', 'delta each in each line with shortened relation');
run_with_input_produces_output(['--short-relations', '--relative-to-first'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 20181208_060000, she said "1 day before it was good, until also 23 hours before it".', 'relative to first with shortened relation');
run_with_input_produces_output(['--short-relations', '--relative-to', '20190108_060000'], 'At 20181208_060000, she said "20181207_060000 was good, until 20181207_070000".', 'At 31 days before it, she said "32 days before it was good, until 32 days before it".', 'relative to base date with shortened relation');

run_with_input_produces_output(['--short-relations', '--keep-width', '--prefix', '-[', '--suffix', ']-'], 'At 20190122_060000.', 'At -[15 hours ago]-.', 'constant-width output with shortened relation');

done_testing;
