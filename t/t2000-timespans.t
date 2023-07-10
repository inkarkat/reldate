use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--timespan', '60'], '1 minute', 'timespan of 60 seconds');
run_produces_output(['--timespan', '-60'], '1 minute ago', 'timespan of -60 seconds');
run_produces_output(['--timespan', '+60'], 'in 1 minute', 'timespan of +60 seconds');

run_produces_output(['--timespan', '120'], '2 minutes', 'timespan of 120 seconds');
run_produces_output(['--timespan', '122'], '2 minutes', 'timespan of 122 seconds');

run_produces_output(['--timespan', '1'], '1 second', 'timespan of 1 second');
run_produces_output(['--timespan', '0'], 'no time', 'timespan of 0 seconds');
run_produces_output(['--timespan', '-0'], 'just now', 'timespan of -0 seconds');
run_produces_output(['--timespan', '+0'], 'just now', 'timespan of +0 seconds');

run_produces_output(['--timespan', '86400'], '1 day', 'timespan of 1 day');
run_produces_output(['--timespan', '-86400'], 'yesterday', 'timespan of -1 day');
run_produces_output(['--timespan', '+86400'], 'tomorrow', 'timespan of +1 day');

done_testing;
