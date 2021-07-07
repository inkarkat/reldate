use Modern::Perl;
use Test::More;
use Test::Reldate;

my @args = ('--date-pattern', '');

run_with_input_produces_output([@args], "At 2019-01-22 06:00:20, it broke.", "At 2019-01-22 06:00:20, it broke.", 'does not parse Y-m-d H:M:S any longer');
run_with_input_produces_output([@args], "At 2019-Jan-22 06:00, it broke.", "At 2019-Jan-22 06:00, it broke.", 'does not parse Y-b-d H:M any longer');
run_with_input_produces_output([@args], "At 2019-January-22 06:00:20, it broke.", "At 2019-January-22 06:00:20, it broke.", 'does not parse Y-B-d H:M:S any longer');
run_with_input_produces_output([@args], "At 22-01-2019 06:00, it broke.", "At 22-01-2019 06:00, it broke.", 'does not parse d-m-Y H:M any longer');
run_with_input_produces_output([@args], "At 22-Jan-2019 06:00:20, it broke.", "At 22-Jan-2019 06:00:20, it broke.", 'does not parse d-b-Y H:M:S any longer');
run_with_input_produces_output([@args], "At 22-January-2019, it broke.", "At 22-January-2019, it broke.", 'does not parse d-B-Y any longer');
run_with_input_produces_output([@args], "At Jan 22, 2019 06:00, it broke.", "At Jan 22, 2019 06:00, it broke.", 'does not parse b d, Y H:M any longer');
run_with_input_produces_output([@args], "At 2019-01-22T05:00:20Z, it broke.", "At 2019-01-22T05:00:20Z, it broke.", 'does not parse Y-m-dTH:M:SZ any longer');

done_testing;
