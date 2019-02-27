use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = qq{
On 22-Jan-2019, we said "20180501_083000 will happen", as in 2017-05-12 08:00:59.               |
he said (January 22,    2019): "Between 20200530_120000 and 20200604_120000" at 20200601_120000 |
At 2019-January-22 06:00:20, it broke; again after 2019-02-23T05:00:20Z.                        |
That's it.                                                                                      |};

run_with_input_produces_output([], $input, qq{
On 9 hours ago, we said "267 days ago will happen", as in 2 years ago.               |
he said (9 hours ago): "Between in 1 year and in 1 year" at in 1 year |
At 14 hours ago, it broke; again after in 31 days.                        |
That's it.                                                                                      |}, 'default output');

run_with_input_produces_output(['--keep-width'], $input, qq{
On 9 hours ago, we said "267 days ago    will happen", as in 2 years ago        .               |
he said (9 hours ago        ): "Between in 1 year       and in 1 year      " at in 1 year       |
At 14 hours ago            , it broke; again after in 31 days          .                        |
That's it.                                                                                      |}, 'constant-width output');

run_with_input_produces_output(['--keep-width', '--prefix', '-[', '--suffix', ']-'], $input, qq{
On -[9 hours ago]-, we said "-[267 days ago]- will happen", as in -[2 years ago    ]-.               |
he said (-[9 hours ago    ]-): "Between -[in 1 year  ]- and -[in 1 year  ]-" at -[in 1 year  ]- |
At -[14 hours ago        ]-, it broke; again after -[in 31 days      ]-.                        |
That's it.                                                                                      |}, 'constant-width output considers prefix and suffix');

run_with_input_produces_output(['--keep-width', '--prefix', '-[possibly ', '--suffix', ' roundabout, more or less]-'], $input, qq{
On -[possibly 9 hours ago roundabout, more or less]-, we said "-[possibly 267 days ago roundabout, more or less]- will happen", as in -[possibly 2 years ago roundabout, more or less]-.               |
he said (-[possibly 9 hours ago roundabout, more or less]-): "Between -[possibly in 1 year roundabout, more or less]- and -[possibly in 1 year roundabout, more or less]-" at -[possibly in 1 year roundabout, more or less]- |
At -[possibly 14 hours ago roundabout, more or less]-, it broke; again after -[possibly in 31 days roundabout, more or less]-.                        |
That's it.                                                                                      |}, 'prefix and suffix already exceed the available width');

run_with_input_produces_output(['--keep-width', '--precision', '2'], $input, qq{
On 8 hours and 30 minutes ago, we said "266 days and 13 hours ago will happen", as in 1 year and 256 days ago.               |
he said (8 hours and 30 minutes ago): "Between in 1 year and 129 days and in 1 year and 134 days" at in 1 year and 131 days |
At 14 hours and 30 minutes ago, it broke; again after in 31 days and 10 hours.                        |
That's it.                                                                                      |}, 'constant-width output exceeding due to precision');

done_testing;
