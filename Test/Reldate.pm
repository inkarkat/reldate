package Test::Reldate;

use Modern::Perl;
use Test::More;
use autodie 'open';

require 'bin/reldate';

use Exporter 'import';
our @EXPORT = qw($NOW run_with_input_produces_output run_produces_output);

our $NOW = 1548185400;	# 20190122_203000
Local::Reldate->setNowSource(sub { return $NOW; });

sub run_with_input_produces_output {
    my ($argumentsRef, $input, $expected_output, $test_name) = @_;

    my $output;

    open(my $outputHandle, '>', \$output) or die "Can't open memory file: $!";
    my $originalHandle = select $outputHandle;

    my $inputHandle;
    if (defined $input) {
	open($inputHandle, '<', \$input);
    }

    Local::Reldate->run($argumentsRef, $inputHandle);
    chomp $output;
    is($output, $expected_output, $test_name);

    select $originalHandle;
}

sub run_produces_output {
    my ($argumentsRef, $expected_output, $test_name) = @_;
    run_with_input_produces_output($argumentsRef, undef, $expected_output, $test_name);
}

1;
