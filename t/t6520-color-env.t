use Modern::Perl;
use Test::More;
use Test::Reldate;

my $on =  "[";
my $off =  "]";
$ENV{'RELDATE_COLOR_ON'} = $on;
$ENV{'RELDATE_COLOR_OFF'} = $off;

my $input = '20180501_071159, we said 20180501_083000 will happen';

run_with_input_produces_output(['--color', 'always'], $input,
    "${on}267 days ago${off}, we said ${on}267 days ago${off} will happen",
    'override default colors via environment variables');

done_testing;
