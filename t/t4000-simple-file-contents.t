use Modern::Perl;
use Test::More;
use Test::Reldate;

run_with_input_produces_output([], "no dates\nfound here", "no dates\nfound here", 'contents without dates');
run_with_input_produces_output([], "At 20190122_203000.", "At just now.", 'simple format now');
run_with_input_produces_output([], "At 20190122_060000.", "At 15 hours ago.", 'simple format earlier time');
run_with_input_produces_output([], "At 20190108_060000.", "At 15 days ago.", 'simple format earlier date');
run_with_input_produces_output([], 'At 00000000 is not a date.', "At 00000000 is not a date.", '8 zeros is not parsed as date');

run_with_input_produces_output([], qq{
At 20180501_071159, we said "Foo".
At 20181208_060000, she said "Bar".
At 20190108_060000, she said "Nee".
At 20190118_121111, he said "Hi".
At 20190120_124000, she said "me".}, qq{
At 267 days ago, we said "Foo".
At 46 days ago, she said "Bar".
At 15 days ago, she said "Nee".
At 4 days ago, he said "Hi".
At 2 days ago, she said "me".}, 'simple format one per line');

done_testing;
