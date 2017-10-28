use strict; # -*- mode: cperl 
use warnings;
use Test::More 0.96;
use Test::Warnings;

use lib qw(lib/ ../lib); # For local testing
use_ok('HTML::FormatText');

is( HTML::FormatText->format_string('| |'),      "| |\n", 'Check for spaces emitted when fed spaces' );
is( HTML::FormatText->format_string('|&nbsp;|'), "|\xA0|\n", 'Check for spaces emitted when fed &nbsp' );

# finish up
done_testing();
