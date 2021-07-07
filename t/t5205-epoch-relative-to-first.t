use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = '
At @1525151519, we said "@1525156200 will happen".
At @1544245200, she said "@1544158800 was good, until @1544162400".
At @1546923600, she said "Nee".
At @1547809871, he said "Between @1547812800 and @1547812805".
At @1547984400, she met @1547984400.
At @1591005600, he said "Between @1590832800 and @1591264800".';
my $expected = '
At @1525151519, we said "1 hour after it will happen".
At @1544245200, she said "1 day before it was good, until also 23 hours before it".
At @1546923600, she said "Nee".
At @1547809871, he said "Between 49 minutes after it and also 49 minutes after it".
At @1547984400, she met at its time.
At @1591005600, he said "Between 2 days before it and also 3 days after it".';

run_with_input_produces_output(['--relative-to-first'], $input, $expected, 'relativeto first in each line');
run_with_input_produces_output(['--relative-to-first', '--within', 'line'], $input, $expected, 'relativeto first in each line with within arg');

done_testing;
