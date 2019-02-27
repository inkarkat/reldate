use Modern::Perl;
use Test::More;
use Test::Reldate;

my $DAY = 86400;

run_produces_output(['--epoch', $NOW + $DAY], 'tomorrow', 'epoch 1 day later');
run_produces_output(['--with-weekday', '--epoch', $NOW + $DAY], 'coming Wednesday', 'epoch 1 day later as weekday');
run_produces_output(['--epoch', $NOW - $DAY], 'yesterday', 'epoch 1 day earlier');
run_produces_output(['--with-weekday', '--epoch', $NOW - $DAY], 'the previous Monday', 'epoch 1 day earlier as weekday');

run_produces_output(['--with-weekday', '--epoch', $NOW - 6 * $DAY], 'the previous Wednesday', 'epoch 6 days earlier as weekday');
run_produces_output(['--with-weekday', '--epoch', $NOW - 7 * $DAY], 'the previous Tuesday', 'epoch 7 days earlier as weekday');
run_produces_output(['--with-weekday', '--epoch', $NOW - 8 * $DAY], '8 days ago (a Monday)', 'epoch 8 days earlier as weekday');
run_produces_output(['--with-weekday', '--epoch', $NOW - 15 * $DAY], '15 days ago (a Monday)', 'epoch 15 days earlier as weekday');

run_produces_output(['--with-weekday', '--epoch', $NOW + 6 * $DAY], 'coming Monday', 'epoch 6 days later as weekday');
run_produces_output(['--with-weekday', '--epoch', $NOW + 7 * $DAY], 'coming Tuesday', 'epoch 7 days later as weekday');
run_produces_output(['--with-weekday', '--epoch', $NOW + 8 * $DAY], '8 days from now (a Wednesday)', 'epoch 8 days later as weekday');
run_produces_output(['--with-weekday', '--epoch', $NOW + 15 * $DAY], '15 days from now (a Wednesday)', 'epoch 15 days later as weekday');

done_testing;
