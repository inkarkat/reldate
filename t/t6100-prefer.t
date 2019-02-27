use Modern::Perl;
use Test::More;
use Test::Reldate;

my $customDateArg = '--date-pattern';
my $customDateTimePattern = '(?<month>\d\d)-(?<day>\d\d)T(?<hours>\d\d):(?<minutes>\d\d):(?<seconds>\d\d)';
my $customDateOnlyPattern = '(?<month>\d\d)-(?<day>\d\d)';

run_with_input_produces_output([$customDateArg, $customDateTimePattern], "At 01-22T20:00:00.", "At 30 minutes ago.", 'simple format now 20:00:00 default');
run_with_input_produces_output([$customDateArg, $customDateTimePattern, '--prefer-past'], "At 01-22T20:00:00.", "At 30 minutes ago.", 'simple format now 20:00:00 prefer past');
run_with_input_produces_output([$customDateArg, $customDateTimePattern, '--prefer-future'], "At 01-22T20:00:00.", "At in 1 year.", 'simple format now 20:00:00 prefer future');

run_with_input_produces_output([$customDateArg, $customDateOnlyPattern], "At 01-21.", "At yesterday.", 'simple format yesterday default');
run_with_input_produces_output([$customDateArg, $customDateOnlyPattern], "At 01-23.", "At in 16 hours.", 'simple format tomorrow default');
run_with_input_produces_output([$customDateArg, $customDateOnlyPattern, '--prefer-past'], "At 01-21.", "At yesterday.", 'simple format yesterday prefer past');
run_with_input_produces_output([$customDateArg, $customDateOnlyPattern, '--prefer-past'], "At 01-23.", "At 364 days ago.", 'simple format tomorrow prefer past');
run_with_input_produces_output([$customDateArg, $customDateOnlyPattern, '--prefer-future'], "At 01-23.", "At in 16 hours.", 'simple format tomorrow prefer future');
run_with_input_produces_output([$customDateArg, $customDateOnlyPattern, '--prefer-future'], "At 01-21.", "At in 364 days.", 'simple format yesterday prefer future');

done_testing;
