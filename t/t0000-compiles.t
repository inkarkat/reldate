use Modern::Perl;
use Test::More;
use Test::Script;

script_compiles('../bin/reldate');
script_runs(['../bin/reldate', '--help']);

done_testing;
