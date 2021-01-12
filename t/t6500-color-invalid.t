use Modern::Perl;
use Test::More;
use Test::Script;

script_runs(['bin/reldate', '--color', 'isNoWhat'], {exit => 2}, 'invalid WHAT');

script_runs(['bin/reldate', '--color', 'always', '--no-color'], {exit => 2}, 'conflicting --color and --no-color');
script_stderr_like qr{cannot combine --no-color with --color}, 'cannot combine message';

script_runs(['bin/reldate', '--color', 'never', '--no-color'], {stdin => \'', exit => 0}, 'agreeing --color and --no-color');

done_testing;
