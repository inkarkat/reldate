use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = qq{
At 20181001_071159, we said "FOO".
At 20181108_060000, she said "BAR".
---
At 20180501_071159, we said "Foo".
At 20181208_060000, she said "20181208_070000"
At 20190108_060000, she said "Nee".
---
At 20190118_121111, he said "Hi".
At 20190120_124000, she said "me".};

run_with_input_produces_output(['--delta-to-first', '--reset', '---'], $input, qq{
At 114 days ago, we said "FOO".
At 38 days later than it, she said "BAR".
---
At 267 days ago, we said "Foo".
At 221 days later than it, she said "also 221 days later than it"
At also 252 days later than it, she said "Nee".
---
At 4 days ago, he said "Hi".
At 2 days later than it, she said "me".}, 'delta to first in block');

run_with_input_produces_output(['--delta-each', '--reset', '---'], $input, qq{
At 114 days ago, we said "FOO".
At 38 days later, she said "BAR".
---
At 267 days ago, we said "Foo".
At 221 days later, she said "1 hour later"
At 31 days later, she said "Nee".
---
At 4 days ago, he said "Hi".
At 2 days later, she said "me".}, 'delta each in block');

run_with_input_produces_output(['--relative-to-first', '--reset', '---'], $input, qq{
At 20181001_071159, we said "FOO".
At 38 days later than it, she said "BAR".
---
At 20180501_071159, we said "Foo".
At 221 days later than it, she said "also 221 days later than it"
At also 252 days later than it, she said "Nee".
---
At 20190118_121111, he said "Hi".
At 2 days later than it, she said "me".}, 'relative to first in block');

run_with_input_produces_output(['--relative-each', '--reset', '---'], $input, qq{
At 20181001_071159, we said "FOO".
At 38 days later, she said "BAR".
---
At 20180501_071159, we said "Foo".
At 221 days later, she said "1 hour later"
At 31 days later, she said "Nee".
---
At 20190118_121111, he said "Hi".
At 2 days later, she said "me".}, 'relative each in block');

done_testing;
