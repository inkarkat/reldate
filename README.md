### DESCRIPTION

_Show relative dates instead of absolute ones._

**reldate** turns absolute dates (e.g. <u>09-02-2016</u>) into timespans relative to
the current date (<u>2 days ago</u>).

It parses text from stdin (or passed FILE(s)) and replaces any date [as
specified by PATTERN] with a relative one.

It directly converts the passed timespan (in SECONDS), or the passed
EPOCH.

It prints the modification date, relative to now, of the passed FILE.

### DEPENDENCIES

On Ubuntu, this requires the following packages:

    $ apt-get install libmodern-perl-perl libtime-duration-perl libio-interative-perl

On CentOS, this requires the following packages:

    $ yum install perl-Modern-Perl perl-Time-Duration perl-Time-Piece perl-IO-Interactive

