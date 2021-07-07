use Modern::Perl;
use Test::More;
use Test::Reldate;

run_with_input_produces_output([], "no diffs\nfound here", "no diffs\nfound here", 'contents without diffs');
run_with_input_produces_output([], 'XXX+00:10', 'XXX+00:10', 'no word boundary before diff');
run_with_input_produces_output([], '+00:10XXX', '+00:10XXX', 'no word boundary after diff');
run_with_input_produces_output([], '+00:00', "also then", 'just MM:SS diff now');
run_with_input_produces_output([], 'At +00:00.', "At also then.", 'MM:SS diff now');
run_with_input_produces_output([], 'At -14:30:00.', "At 15 hours earlier.", 'HH:MM:SS diff earlier time');
run_with_input_produces_output([], 'At +14:30:00.', "At 15 hours later.", 'HH:MM:SS diff later time');
run_with_input_produces_output([], 'At -350:00:00.', "At 15 days earlier.", 'HHH:MM:SS diff earlier date');
run_with_input_produces_output([], 'At +350:00:00.', "At 15 days later.", 'HHH:MM:SS diff later date');

run_with_input_produces_output([], qq{
At -6398:18:01, we said "Foo".
At -1094:30:00, she said "Bar".
At -350:30:00, she said "Nee".
At -104:18:49, he said "Hi".
At -55:50:00, she said "me".}, qq{
At 267 days earlier, we said "Foo".
At 46 days earlier, she said "Bar".
At 15 days earlier, she said "Nee".
At 4 days earlier, he said "Hi".
At 2 days earlier, she said "me".}, 'diff one per line');

done_testing;
