use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = qq{
20180501_071159, we said "20180501_083000 will happen".
he said "Between 20200530_120000 and 20200604_120000" at 20200601_120000};

run_with_input_produces_output(['--prefix', '-->'], $input, qq{
-->267 days ago, we said "-->267 days ago will happen".
he said "Between -->in 1 year and -->in 1 year" at -->in 1 year}, 'prefixing with -->');

run_with_input_produces_output(['--suffix', '<--'], $input, qq{
267 days ago<--, we said "267 days ago<-- will happen".
he said "Between in 1 year<-- and in 1 year<--" at in 1 year<--}, 'suffixing with <--');

run_with_input_produces_output(['--prefix', '[', '--suffix', ']'], $input, qq{
[267 days ago], we said "[267 days ago] will happen".
he said "Between [in 1 year] and [in 1 year]" at [in 1 year]}, 'wrapping with [...]');

done_testing;
