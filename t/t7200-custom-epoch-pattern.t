use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--epoch-pattern', '^(?<epoch>\d{1,10})$');

run_with_input_produces_output([@args], '
1525151519
1544245200
1546923600
1547809871
1547984400
1591005600', qq{
267 days ago
46 days ago
15 days ago
4 days ago
2 days ago
in 1 year}, 'custom epoch pattern of one per line');

run_with_input_produces_output([@args], '
1525151519
2019-01-22 06:00:20
1591005600', qq{
267 days ago
14 hours ago
in 1 year}, 'custom epoch pattern still parses other dates');

done_testing;
