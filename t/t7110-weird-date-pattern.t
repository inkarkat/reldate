use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--date-pattern', '<(?<seconds>\d\d)<(?<minutes>\d\d)<(?<hours>\d\d)(?:::(?<timezone>Z))?::Y(?<year>\d\d\d\d)M(?<month>\d\d)D(?<day>\d\d)\b', '--precision', '3');

run_with_input_produces_output([@args], "At <20<00<06::Y2019M01D22, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'custom pattern without optional timezone');
run_with_input_produces_output([@args], "At <20<00<05::Z::Y2019M01D22, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'custom pattern with optional timezone');

done_testing;
