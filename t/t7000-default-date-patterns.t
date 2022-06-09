use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--precision', '3');

run_with_input_produces_output([@args], "At 20190122_060020, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Ymd_HMS');
run_with_input_produces_output([@args], "At 20190122-060020, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Ymd-HMS');
run_with_input_produces_output([@args], "At 20190122 060020, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Ymd HMS');
run_with_input_produces_output([@args], "At 20190122_0600, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'Ymd HM');
run_with_input_produces_output([@args], "At 20190122, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'Ymd');


run_with_input_produces_output([@args], "At 2019-01-22 06:00:20, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Y-m-d H:M:S');
run_with_input_produces_output([@args], "At 2019-01-22 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'Y-m-d H:M');
run_with_input_produces_output([@args], "At 2019-01-22, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'Y-m-d');

run_with_input_produces_output([@args], "At 2019-Jan-22 06:00:20, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Y-b-d H:M:S');
run_with_input_produces_output([@args], "At 2019-Jan-22 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'Y-b-d H:M');
run_with_input_produces_output([@args], "At 2019-Jan-22, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'Y-b-d');

run_with_input_produces_output([@args], "At 2019-January-22 06:00:20, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Y-B-d H:M:S');
run_with_input_produces_output([@args], "At 2019-January-22 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'Y-B-d H:M');
run_with_input_produces_output([@args], "At 2019-January-22, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'Y-B-d');


run_with_input_produces_output([@args], "At 22-01-2019 06:00:20, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'd-m-Y H:M:S');
run_with_input_produces_output([@args], "At 22-01-2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'd-m-Y H:M');
run_with_input_produces_output([@args], "At 22-01-2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'd-m-Y');

run_with_input_produces_output([@args], "At 22-Jan-2019 06:00:20, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'd-b-Y H:M:S');
run_with_input_produces_output([@args], "At 22-Jan-2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'd-b-Y H:M');
run_with_input_produces_output([@args], "At 22-Jan-2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'd-b-Y');

run_with_input_produces_output([@args], "At 22-January-2019 06:00:20, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'd-B-Y H:M:S');
run_with_input_produces_output([@args], "At 22-January-2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'd-B-Y H:M');
run_with_input_produces_output([@args], "At 22-January-2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'd-B-Y');


run_with_input_produces_output([@args], "At 01 22 2019 06:00, it broke.", "At 01 22 2019 06:00, it broke.", 'unsupported: m d Y H:M');
run_with_input_produces_output([@args], "At Jan 22 2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'b d Y H:M');
run_with_input_produces_output([@args], "At January 22 2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'B d Y H:M');
run_with_input_produces_output([@args], "At Jan 22, 2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'b d, Y H:M');
run_with_input_produces_output([@args], "At January 22, 2019 06:00, it broke.", "At 14 hours and 30 minutes ago, it broke.", 'B d, Y H:M');

run_with_input_produces_output([@args], "At Jan 22 2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'b d Y');
run_with_input_produces_output([@args], "At January 22 2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'B d Y');
run_with_input_produces_output([@args], "At Jan 22, 2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'b d, Y');
run_with_input_produces_output([@args], "At January 22, 2019, it broke.", "At 8 hours and 30 minutes ago, it broke.", 'B d, Y');


run_with_input_produces_output([@args], "At 2019-01-22T05:00:20, it broke.", "At 15 hours, 29 minutes, and 40 seconds ago, it broke.", 'Y-m-dTH:M:S');
run_with_input_produces_output([@args], "At 2019-01-22_05:00:20Z, it broke.", "At 2019-01-22_05:00:20Z, it broke.", 'unsupported: Y-m-d_H:M:SZ');
run_with_input_produces_output([@args], "At 2019-01-22T05:00:20Z, it broke.", "At 14 hours, 29 minutes, and 40 seconds ago, it broke.", 'Y-m-dTH:M:SZ');

done_testing;
