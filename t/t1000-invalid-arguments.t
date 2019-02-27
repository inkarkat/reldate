use Modern::Perl;
use Test::More;
use Test::Script;

script_runs(['../bin/reldate', '--relative-to', 'isNoDate'], {exit => 2}, 'invalid BASE-DATE');
script_stderr_like qr{isNoDate is not a valid BASE-DATE!}, 'invalid BASE-DATE message';

script_runs(['../bin/reldate', '--relative-to-epoch', 'isNoDate'], {exit => 2}, 'invalid BASE-DATE');
script_stderr_like qr{Value "isNoDate" invalid for option relative-to-epoch \(number expected\)}, 'invalid epoch message';

script_runs(['../bin/reldate', 'path/to/doesNotExist'], {exit => 1}, 'pass nonexistent filespec');
script_stderr_like qr{path/to/doesNotExist does not exist!}, 'nonexistent filespec message';

done_testing;
