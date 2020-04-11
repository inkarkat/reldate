use Modern::Perl;
use Test::More;
use Test::Reldate;

my $on =  "\e[07m";
my $off =  "\e[0m";

my $input = '20180501_071159, we said 20180501_083000 will happen';

run_with_input_produces_output(['--color', 'always'], $input,
    "${on}267 days ago${off}, we said ${on}267 days ago${off} will happen",
    'forced color');

run_with_input_produces_output(['--color', 'always', '--prefix', '<', '--suffix', '>'], $input,
    "${on}<267 days ago>${off}, we said ${on}<267 days ago>${off} will happen",
    'coloring includes prefix and suffix');

done_testing;
