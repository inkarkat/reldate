use Modern::Perl;
use Test::More;
use Test::Reldate;

run_produces_output(['--epoch', $NOW + 60], 'in 1 minute', 'epoch 60 seconds later');
run_produces_output(['--epoch', $NOW - 60], '1 minute ago', 'epoch 60 seconds earlier');

run_produces_output(['--epoch', $NOW - 120], '2 minutes ago', 'epoch 120 seconds earlier');
run_produces_output(['--epoch', $NOW - 122], '2 minutes ago', 'epoch 122 seconds earlier');

run_produces_output(['--epoch', $NOW - 1], '1 second ago', 'epoch 1 second earlier');
run_produces_output(['--epoch', $NOW], 'just now', 'same epoch');

run_produces_output(['--epoch', $NOW + 86400], 'tomorrow', 'epoch 1 day later');
run_produces_output(['--epoch', $NOW - 86400], 'yesterday', 'epoch 1 day earlier');

done_testing;
