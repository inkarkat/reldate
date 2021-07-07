use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--diff-pattern', '(?<!\w)(?<sign>[+-])?(?<seconds>\d{1,10})\b');

run_with_input_produces_output([@args], 'At -52200.', "At 15 hours earlier.", 'seconds diff earlier time');
run_with_input_produces_output([@args], 'At +52200.', "At 15 hours later.", 'seconds diff later time');
run_with_input_produces_output([@args], 'At 52200.', "At 15 hours later.", 'seconds diff later time');
run_with_input_produces_output([@args], 'At -1261800.', "At 15 days earlier.", 'seconds diff earlier date');
run_with_input_produces_output([@args], 'At +1261800.', "At 15 days later.", 'seconds diff later date');
run_with_input_produces_output([@args], 'At 1261800.', "At 15 days later.", 'seconds diff later date');

run_with_input_produces_output([@args], qq{
At -23033881, we said "Foo".
At -3940200, she said "Bar".
At -1261800, she said "Nee".
At -375529, he said "Hi".
At -201000, she said "me".}, qq{
At 267 days earlier, we said "Foo".
At 46 days earlier, she said "Bar".
At 15 days earlier, she said "Nee".
At 4 days earlier, he said "Hi".
At 2 days earlier, she said "me".}, 'diff one per line');

done_testing;
