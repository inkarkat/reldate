### DESCRIPTION
reldate turns absolute dates (e.g. *09-02-2016*) into timespans relative
to the current date (*2 days ago*).

It parses text from stdin (or passed FILE(s)) and replaces any date [as
specified by PATTERN] with a relative one.

It directly converts the passed / read from stdin timespan (in SECONDS),
or EPOCH.

It prints the modification date, relative to now, of the passed FILE.

### DEPENDENCIES
On Ubuntu, this requires the following packages:

    $ apt-get install libio-interactive-perl libmodern-perl-perl libtime-duration-perl perl-doc

On CentOS, this requires the following packages:

    $ yum install perl-Modern-Perl perl-Time-Duration perl-Time-Piece

### DEVELOPMENT
On Ubuntu, this requires the following additional packages:

    $ apt-get install libtest-script-perl

Run the test suite from the project directory via

    $ TZ='Europe/Berlin' prove -I.

