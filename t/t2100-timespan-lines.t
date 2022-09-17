use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--timespan-lines');

run_with_input_produces_output([@args], '
60
+60
-60

120
122

1
0
+0
-0

86400
+86400
-86400', '
1 minute
1 minute ago
in 1 minute

2 minutes
2 minutes

1 second
no time
just now
just now

1 day
yesterday
tomorrow', 'various timespan lines');

run_with_input_produces_output([@args], '
no date
 380775726
	380775726
following 380775726
380775726
380775726 380775726
380775726 foobar
380775726	tab separated
380775726	  
+6000
-42', '
no date
 380775726
	380775726
following 380775726
12 years
12 years 380775726
12 years foobar
12 years	tab separated
12 years	  
2 hours ago
in 42 seconds', 'timespans mixed with other text');

done_testing;
