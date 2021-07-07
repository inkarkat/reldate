use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--epoch-pattern', '');

run_with_input_produces_output([@args], 'At @1548133200.', 'At @1548133200.', 'does not parse epoch any longer');

run_with_input_produces_output(['--date-pattern', '', '--epoch-pattern', ''], 'At 2019-01-22 06:00:20 or @1548133200, it broke.', 'At 2019-01-22 06:00:20 or @1548133200, it broke.', 'does not parse Y-m-d H:M:S nor @epoch any longer');

done_testing;
