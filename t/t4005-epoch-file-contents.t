use Modern::Perl;
use Test::More;
use Test::Reldate;

run_with_input_produces_output([], "no dates\nfound here", "no dates\nfound here", 'contents without dates');
run_with_input_produces_output([], 'XXX@1548185400', 'XXX@1548185400', 'no word boundary before epoch');
run_with_input_produces_output([], '@1548185400XXX', '@1548185400XXX', 'no word boundary after epoch');
run_with_input_produces_output([], '@1548185400', "just now", 'just epoch now');
run_with_input_produces_output([], 'At @1548185400.', "At just now.", 'epoch now');
run_with_input_produces_output([], 'At @1548133200.', "At 15 hours ago.", 'epoch earlier time');
run_with_input_produces_output([], 'At @1546923600.', "At 15 days ago.", 'epoch earlier date');

run_with_input_produces_output([], '
At @1525151519, we said "Foo".
At @1544245200, she said "Bar".
At @1546923600, she said "Nee".
At @1547809871, he said "Hi".
At @1547984400, she said "me".', qq{
At 267 days ago, we said "Foo".
At 46 days ago, she said "Bar".
At 15 days ago, she said "Nee".
At 4 days ago, he said "Hi".
At 2 days ago, she said "me".}, 'epoch one per line');

done_testing;
