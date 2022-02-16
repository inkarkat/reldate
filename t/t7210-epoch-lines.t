use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--epoch-lines');

run_with_input_produces_output([@args], '
@1525151519
@1544245200
@1546923600
1547809871
1547984400
1591005600', '
267 days ago
46 days ago
15 days ago
4 days ago
2 days ago
in 1 year', 'epoch lines');

run_with_input_produces_output([@args], '
1525151519
2019-01-22 06:00:20
1591005600', qq{
267 days ago
2019-01-22 06:00:20
in 1 year}, 'epoch lines do not parse other dates any longer');

run_with_input_produces_output([@args], '
@1525151519 and more, but no @1546923600
2019-01-22 06:00:20 1547809871
1547984400---@1547984400
@1591005600	foo', '
267 days ago and more, but no @1546923600
2019-01-22 06:00:20 1547809871
1547984400---@1547984400
in 1 year	foo', 'epoch lines can be followed by whitespace and then other text');

done_testing;
