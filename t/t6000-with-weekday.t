use Modern::Perl;
use Test::More;
use Test::Reldate;

my $input = qq{
-9: 20190113_203000
-8: 20190114_203000
-7: 20190115_203000
-6: 20190116_203000
-5: 20190117_203000
-4: 20190118_203000
-3: 20190119_203000
-2: 20190120_203000
-1: 20190121_203000
 0: 20190122_203000
 1: 20190123_203000
 2: 20190124_203000
 3: 20190125_203000
 4: 20190126_203000
 5: 20190127_203000
 6: 20190128_203000
 7: 20190129_203000
 8: 20190130_203000
 9: 20190131_203000
};

run_with_input_produces_output([], $input, qq{
-9: 9 days ago
-8: 8 days ago
-7: 7 days ago
-6: 6 days ago
-5: 5 days ago
-4: 4 days ago
-3: 3 days ago
-2: 2 days ago
-1: yesterday
 0: just now
 1: tomorrow
 2: in 2 days
 3: in 3 days
 4: in 4 days
 5: in 5 days
 6: in 6 days
 7: in 7 days
 8: in 8 days
 9: in 9 days}, '+/-9 dates around today');

run_with_input_produces_output(['--with-weekday'], $input, qq{
-9: 9 days ago (a Sunday)
-8: 8 days ago (a Monday)
-7: the previous Tuesday
-6: the previous Wednesday
-5: the previous Thursday
-4: the previous Friday
-3: the previous Saturday
-2: the previous Sunday
-1: the previous Monday
 0: just now
 1: coming Wednesday
 2: coming Thursday
 3: coming Friday
 4: coming Saturday
 5: coming Sunday
 6: coming Monday
 7: coming Tuesday
 8: 8 days from now (a Wednesday)
 9: 9 days from now (a Thursday)}, '+/-9 dates around today with weekday');

done_testing;
